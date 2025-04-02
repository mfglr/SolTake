using MediatR;
using MySocailApp.Application.Commands.SolutionDomain.SolutionAggregate.CreateSolution;
using MySocailApp.Application.Configurations;
using MySocailApp.Application.InfrastructureServices;
using MySocailApp.Application.InfrastructureServices.BlobService;
using MySocailApp.Application.InfrastructureServices.BlobService.Objects;
using MySocailApp.Application.InfrastructureServices.IAService;
using MySocailApp.Application.InfrastructureServices.IAService.Objects;
using MySocailApp.Core;
using MySocailApp.Domain.QuestionDomain.QuestionAggregate.Abstracts;
using MySocailApp.Domain.QuestionDomain.QuestionAggregate.Exceptions;
using MySocailApp.Domain.SolutionDomain.SolutionAggregate.Abstracts;
using MySocailApp.Domain.SolutionDomain.SolutionAggregate.Entities;
using MySocailApp.Domain.SolutionDomain.SolutionAggregate.ValueObjects;

namespace MySocailApp.Application.Commands.SolutionDomain.SolutionAggregate.CreateSolutionByAI
{
    public class CreateSolutionByAIHandler(ChatGPT_Service chatGPTService, IQuestionReadRepository questionReadRepository, ISolutionWriteRepository solutionWriteRepository, IUnitOfWork unitOfWork, IFrameCatcher frameCatcher, ITempDirectoryService tempDirectoryService, IApplicationSettings applicationSettings, IAccessTokenReader accessTokenReader) : IRequestHandler<CreateSolutionByAIDto, CreateSolutionResponseDto>
    {
        private readonly ChatGPT_Service _chatGPTService = chatGPTService;
        private readonly IFrameCatcher _frameCatcher = frameCatcher;
        private readonly IQuestionReadRepository _questionReadRepository = questionReadRepository;
        private readonly ISolutionWriteRepository _solutionWriteRepository = solutionWriteRepository;
        private readonly IUnitOfWork _unitOfWork = unitOfWork;
        private readonly ITempDirectoryService _tempDirectoryService = tempDirectoryService;
        private readonly IApplicationSettings _applicationSettings = applicationSettings;
        private readonly IAccessTokenReader _accessTokenReader = accessTokenReader;

        public async Task<CreateSolutionResponseDto> Handle(CreateSolutionByAIDto request, CancellationToken cancellationToken)
        {

            var login = _accessTokenReader.GetLogin();

            var question =
                await _questionReadRepository.GetAsync(request.QuestionId, cancellationToken) ??
                throw new QuestionNotFoundException();

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
                    var chatGptRequest = new ChatGPT_Request(
                        request.Model,
                        [
                            new(
                            ChatGPT_Roles.User,
                            [
                                new ChatGPT_TextContent(request.Prompt!),
                                new ChatGPT_ImageContent(
                                    new(
                                        GetUrl(media.ContainerName,media.BlobName),
                                        ChatGPT_ImageResolution.Low
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

                                var chatGptRequest = new ChatGPT_Request(
                                    request.Model,
                                    [
                                        new(
                                        ChatGPT_Roles.User,
                                        [
                                            new ChatGPT_TextContent(request.Prompt!),
                                            new ChatGPT_ImageContent(
                                                new(
                                                    GetUrl(ContainerName.Temp,frameBlobName),
                                                    ChatGPT_ImageResolution.Low
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

            //create solution
            var model = new SolutionAIModel(request.Model);
            var content = new SolutionContent(response.Choices.First().Message.Content);
            var solution = new Solution(request.QuestionId, login.UserId, content, model);
            solution.Create(question,login);

            await _solutionWriteRepository.CreateAsync(solution, cancellationToken);

            //comit changes
            await _unitOfWork.CommitAsync(cancellationToken);

            return new (solution, login);
        }

        private string GetUrl(string containerName, string blobName)
            => $"{_applicationSettings.BlobUrl}/{containerName}/{blobName}";
    }
}
