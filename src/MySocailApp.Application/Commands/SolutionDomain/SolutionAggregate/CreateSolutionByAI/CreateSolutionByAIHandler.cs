using MediatR;
using MySocailApp.Application.Commands.SolutionDomain.SolutionAggregate.CreateSolution;
using MySocailApp.Application.InfrastructureServices;
using MySocailApp.Application.InfrastructureServices.BlobService;
using MySocailApp.Application.InfrastructureServices.BlobService.Objects;
using MySocailApp.Application.InfrastructureServices.IAService;
using MySocailApp.Application.InfrastructureServices.IAService.Objects;
using MySocailApp.Core;
using MySocailApp.Domain.BalanceAggregate.Abstracts;
using MySocailApp.Domain.BalanceAggregate.ValueObjects;
using MySocailApp.Domain.QuestionAggregate.Abstracts;
using MySocailApp.Domain.QuestionAggregate.Entities;
using MySocailApp.Domain.SolutionAggregate.Abstracts;
using MySocailApp.Domain.SolutionAggregate.DomainEvents;
using MySocailApp.Domain.SolutionAggregate.Entities;
using MySocailApp.Domain.SolutionAggregate.Exceptions;
using MySocailApp.Domain.SolutionAggregate.ValueObjects;
using MySocailApp.Domain.TransactionAggregate.Abstracts;
using MySocailApp.Domain.TransactionAggregate.Entities;
using MySocailApp.Domain.UserUserBlockAggregate.Abstracts;

namespace MySocailApp.Application.Commands.SolutionDomain.SolutionAggregate.CreateSolutionByAI
{
    public class CreateSolutionByAIHandler(ChatGPT_Service chatGPTService, IQuestionReadRepository questionReadRepository, ISolutionWriteRepository solutionWriteRepository, IUnitOfWork unitOfWork, IFrameCatcher frameCatcher, ITempDirectoryService tempDirectoryService, IAccessTokenReader accessTokenReader, IImageToBase64Convertor imageToBase64Convertor, IBalanceRepository balanceRepository, IUserUserBlockRepository userUserBlockRepository, IPublisher publisher, ITransactionRepository transactionRepository) : IRequestHandler<CreateSolutionByAIDto, CreateSolutionResponseDto>
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

        private async Task<ChatGBT_Response> GenerateAIResponse(CreateSolutionByAIDto request, Question question, CancellationToken cancellationToken)
        {
            ChatGBT_Response response;
            if (!question.Medias.Any())
            {
                var chatGptRequest = new ChatGPT_Request(
                    request.Model,
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
                        request.Model,
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
                                    request.Model,
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

        public async Task<CreateSolutionResponseDto> Handle(CreateSolutionByAIDto request, CancellationToken cancellationToken)
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

            var response = await GenerateAIResponse(request, question, cancellationToken);

            //create solution
            var model = new SolutionAIModel(request.Model, response.Usage.PrompTokens, response.Usage.CompletionTokens);
            var content = new SolutionContent(response.Choices.First().Message.Content);
            var solution = new Solution(request.QuestionId, login.UserId, content, model);
            solution.Create();
            await _solutionWriteRepository.CreateAsync(solution, cancellationToken);

            //update balance
            var balance = await _balanceRepository.GetAsync(login.UserId, cancellationToken);
            balance.Apply(Money.Dollar(-1 * solution.Cost));

            //create transaction
            var transaction = new Transaction(login.UserId, Money.Dollar(solution.Cost));
            transaction.Create();
            await _transactionRepository.CreateAsync(transaction, cancellationToken);

            //comit changes
            await _unitOfWork.CommitAsync(cancellationToken);
            await _publisher.Publish(new SolutionCreatedDomainEvent(question, solution, login), cancellationToken);

            return new(solution, login);
        }
    }
}
