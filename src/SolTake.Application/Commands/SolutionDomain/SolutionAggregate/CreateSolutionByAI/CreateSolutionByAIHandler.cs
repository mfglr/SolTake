using MediatR;
using MySocailApp.Application.InfrastructureServices;
using MySocailApp.Application.InfrastructureServices.BlobService;
using MySocailApp.Application.InfrastructureServices.BlobService.Objects;
using MySocailApp.Application.InfrastructureServices.IAService;
using MySocailApp.Application.InfrastructureServices.IAService.Objects;
using SolTake.Domain.QuestionAggregate.Abstracts;
using SolTake.Domain.QuestionAggregate.Entities;
using SolTake.Domain.SolutionAggregate.Abstracts;
using SolTake.Domain.SolutionAggregate.DomainEvents;
using SolTake.Domain.SolutionAggregate.Entities;
using SolTake.Domain.SolutionAggregate.Exceptions;
using SolTake.Domain.SolutionAggregate.ValueObjects;
using SolTake.Domain.TransactionAggregate.Abstracts;
using SolTake.Domain.TransactionAggregate.Entities;
using SolTake.Domain.UserUserBlockAggregate.Abstracts;
using SolTake.Core;
using SolTake.Domain.AIModelAggregate.Abstracts;
using SolTake.Domain.AIModelAggregate.Entities;
using SolTake.Domain.AIModelAggregate.Exceptions;
using SolTake.Domain.BalanceAggregate.Abstracts;

namespace MySocailApp.Application.Commands.SolutionDomain.SolutionAggregate.CreateSolutionByAI
{
    public class CreateSolutionByAIHandler(ChatGPT_Service chatGPTService, IQuestionReadRepository questionReadRepository, ISolutionWriteRepository solutionWriteRepository, IUnitOfWork unitOfWork, IFrameCatcher frameCatcher, ITempDirectoryService tempDirectoryService, IAccessTokenReader accessTokenReader, IImageToBase64Convertor imageToBase64Convertor, IBalanceRepository balanceRepository, IUserUserBlockRepository userUserBlockRepository, IPublisher publisher, ITransactionRepository transactionRepository, IAIModelCacheService aiModelCacheService) : IRequestHandler<CreateSolutionByAIDto, CreateSolutionByAIResponseDto>
    {
        private readonly ChatGPT_Service _chatGPTService = chatGPTService;
        private readonly IFrameCatcher _frameCatcher = frameCatcher;
        private readonly IQuestionReadRepository _questionReadRepository = questionReadRepository;
        private readonly ISolutionWriteRepository _solutionWriteRepository = solutionWriteRepository;
        private readonly IUnitOfWork _unitOfWork = unitOfWork;
        private readonly ITempDirectoryService _tempDirectoryService = tempDirectoryService;
        private readonly IAccessTokenReader _accessTokenReader = accessTokenReader;
        private readonly IImageToBase64Convertor _imageToBase64Convertor = imageToBase64Convertor;
        private readonly IBalanceRepository _balanceRepository = balanceRepository;
        private readonly IUserUserBlockRepository _userUserBlockRepository = userUserBlockRepository;
        private readonly IPublisher _publisher = publisher;
        private readonly ITransactionRepository _transactionRepository = transactionRepository;
        private readonly IAIModelCacheService _aiModelCacheService = aiModelCacheService;

        private async Task<ChatGBT_Response> GenerateAIResponse(AIModel model, CreateSolutionByAIDto request, Question question, CancellationToken cancellationToken)
        {
            ChatGBT_Response response;
            if (!question.Medias.Any())
            {
                var chatGptRequest = new ChatGPT_Request(
                    model.Name.Value,
                    [
                        new(
                            ChatGPT_Roles.User,
                            [
                                new ChatGPT_TextContent(question.Content!.Value),
                            ]
                        ),
                    ]
                );
                response = await _chatGPTService.SendAsync(chatGptRequest);
            }
            else
            {
                var media =
                    question.Medias.FirstOrDefault(x => x.BlobName == request.BlobName) ??
                    throw new QuestionMediaNotFoundException();
                if (media.MultimediaType == MultimediaType.Image)
                {
                    var base64Url = await _imageToBase64Convertor.ToBase64(media.ContainerName, media.BlobName, cancellationToken);

                    var chatGptRequest = new ChatGPT_Request(
                        model.Name.Value,
                        [
                            new(
                            ChatGPT_Roles.User,
                            [
                                new ChatGPT_TextContent(request.Prompt!),
                                new ChatGPT_ImageContent(
                                    new(
                                        base64Url,
                                        request.IsHighResulation ? ChatGPT_ImageResolution.High : ChatGPT_ImageResolution.Low
                                    )
                                )
                            ]
                        ),
                        ]
                    );
                    response = await _chatGPTService.SendAsync(chatGptRequest);
                }
                else
                {
                    response = await _tempDirectoryService
                        .CreateTransactionAsync(
                            async () =>
                            {
                                var frameBlobName = _frameCatcher.CatchFrame(
                                    media.ContainerName,
                                    media.BlobName,
                                    (double)request.Duration!
                                );

                                var base64Url = await _imageToBase64Convertor.ToBase64(ContainerName.Temp, frameBlobName, cancellationToken);

                                var chatGptRequest = new ChatGPT_Request(
                                    model.Name.Value,
                                    [
                                        new(
                                            ChatGPT_Roles.User,
                                            [
                                                new ChatGPT_TextContent(request.Prompt!),
                                                new ChatGPT_ImageContent(
                                                    new(
                                                        base64Url,
                                                        request.IsHighResulation ? ChatGPT_ImageResolution.High : ChatGPT_ImageResolution.Low
                                                    )
                                                )
                                            ]
                                        ),
                                    ]
                                );
                                return await _chatGPTService.SendAsync(chatGptRequest);
                            }
                        );
                }
            }
            return response;
        }

        public async Task<CreateSolutionByAIResponseDto> Handle(CreateSolutionByAIDto request, CancellationToken cancellationToken)
        {
            var login = _accessTokenReader.GetLogin();

            var question =
                await _questionReadRepository.GetAsync(request.QuestionId, cancellationToken) ??
                throw new QuestionNotFoundException();

            if (await _userUserBlockRepository.ExistAsync(question.UserId, login.UserId, cancellationToken))
                throw new QuestionNotFoundException();

            if (await _userUserBlockRepository.ExistAsync(login.UserId, question.UserId, cancellationToken))
                throw new UserBlockedException();

            if (!await _balanceRepository.HasBalance(login.UserId, cancellationToken))
                throw new InsufficientFundsException();

            var aiModel =
                _aiModelCacheService.Get(request.ModelId) ??
                throw new AIModelNotFoundException();

            var response = await GenerateAIResponse(aiModel, request, question, cancellationToken);

            //create solution
            var content = new SolutionContent(response.Choices.First().Message.Content);
            var solution = new Solution(request.QuestionId, login.UserId, content, aiModel.Id);
            solution.Create();
            await _solutionWriteRepository.CreateAsync(solution, cancellationToken);

            //update balance
            var balance = await _balanceRepository.GetAsync(login.UserId, cancellationToken);
            var price = aiModel.CalculatePrice(response.Usage.PrompTokens, response.Usage.CompletionTokens);
            balance.Apply(-1 * price);

            //create transaction
            var transaction = new Transaction(login.UserId, aiModel.Id, response.Usage.PrompTokens, response.Usage.CompletionTokens, aiModel.SolPerInputTokenWithCommission.Amount, aiModel.SolPerOutputTokenWithCommission.Amount);
            transaction.Create();
            await _transactionRepository.CreateAsync(transaction, cancellationToken);

            //comit changes
            await _unitOfWork.CommitAsync(cancellationToken);
            await _publisher.Publish(new SolutionCreatedDomainEvent(question, solution, login), cancellationToken);

            return new(solution, aiModel, login);
        }
    }
}
