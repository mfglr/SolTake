using AccountDomain.AccountAggregate.Abstracts;
using AccountDomain.AccountAggregate.Exceptions;
using AccountDomain.AccountAggregate.ValueObjects;
using MediatR;
using MySocailApp.Application.Commands.SolutionAggregate.CreateSolution;
using MySocailApp.Application.Configurations;
using MySocailApp.Application.InfrastructureServices;
using MySocailApp.Application.InfrastructureServices.IAService;
using MySocailApp.Application.InfrastructureServices.IAService.Exceptions;
using MySocailApp.Application.InfrastructureServices.IAService.Objects;
using MySocailApp.Core;
using MySocailApp.Domain.QuestionDomain.QuestionAggregate.Abstracts;
using MySocailApp.Domain.QuestionDomain.QuestionAggregate.Entities;
using MySocailApp.Domain.QuestionDomain.QuestionAggregate.Excpetions;
using MySocailApp.Domain.SolutionAggregate.Abstracts;
using MySocailApp.Domain.SolutionAggregate.Entities;
using MySocailApp.Domain.SolutionAggregate.ValueObjects;

namespace MySocailApp.Application.Commands.SolutionAggregate.CreateSolutionByAI
{
    public class CreateSolutionByAIHandler(ChatGPT_Service chatGPTService, IApplicationSettings applicationSettings, IQuestionReadRepository questionReadRepository, ISolutionWriteRepository solutionWriteRepository, IUnitOfWork unitOfWork, IAccountReadRepository accountReadRepository, IAccountAccessor accountAccessor) : IRequestHandler<CreateSolutionByAIDto, CreateSolutionResponseDto>
    {
        private readonly ChatGPT_Service _chatGPTService = chatGPTService;
        private readonly IQuestionReadRepository _questionReadRepository = questionReadRepository;
        private readonly IApplicationSettings _applicationSettings = applicationSettings;
        private readonly ISolutionWriteRepository _solutionWriteRepository = solutionWriteRepository;
        private readonly IUnitOfWork _unitOfWork = unitOfWork;
        private readonly IAccountReadRepository _accountReadRepository = accountReadRepository;
        private readonly IAccountAccessor _accountAccessor = accountAccessor;

        private readonly static Dictionary<string, string> _prompts = new(){
            { Languages.EN, "Please solve the question in the image!" },
            { Languages.TR, "Resimdeki soruyu çözer misin?" },
        };

        public async Task<CreateSolutionResponseDto> Handle(CreateSolutionByAIDto request, CancellationToken cancellationToken)
        {
            var userName = new UserName(request.Model);
            var ai =
                await _accountReadRepository.GetAccountByUserName(userName, cancellationToken) ??
                throw new AccountNotFoundException();

            var question =
                await _questionReadRepository.GetQuestionWithImagesById(request.QuestionId, cancellationToken) ??
                throw new QuestionNotFoundException();

            if (!question.IsSolveableByAi)
                throw new NotSolvableByAI();

            var response = await _chatGPTService.SendAsync(CreateRequest(request.Model, question));

            var content = new SolutionContent(response.Choices.First().Message.Content);
            var solution = new Solution(request.QuestionId, ai.Id, content: content);

            await _solutionWriteRepository.CreateAsync(solution, cancellationToken);
            await _unitOfWork.CommitAsync(cancellationToken);

            return new CreateSolutionResponseDto(solution, ai);

        }

        private ChatGPT_Request CreateRequest(string model, Question question)
        {
            if (!question.Medias.Any())
                return new(
                    model,
                    [
                       new(
                            ChatGPT_Roles.User,
                            [ new ChatGPT_TextContent(question.Content!.Value) ]
                       ),
                    ]
                );

            return new(
                model,
                [
                    new(
                        ChatGPT_Roles.User,
                        [
                            new ChatGPT_TextContent(_prompts[_accountAccessor.Account.Language.Value]),
                            new ChatGPT_ImageContent(new(GetUrl(question.Medias[0].ContainerName,question.Medias[0].BlobName),ChatGPT_ImageResolution.Low))
                        ]
                    ),
                ]
            );

        }

        private string GetUrl(string ContainerName, string blobName)
            => $"{_applicationSettings.BlobUrl}/{ContainerName}/{blobName}";

    }
}
