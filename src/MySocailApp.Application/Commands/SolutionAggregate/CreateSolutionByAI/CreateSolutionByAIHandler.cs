using MediatR;
using Microsoft.AspNetCore.Http;
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

namespace MySocailApp.Application.Commands.SolutionAggregate.CreateSolutionByAI
{
    public class CreateSolutionByAIHandler(ISender sender, ChatGPT_Service chatGPTService, IApplicationSettings applicationSettings, IQuestionReadRepository questionReadRepository, IAccountAccessor accountAccessor) : IRequestHandler<CreateSolutionByAIDto, CreateSolutionResponseDto>
    {
        private readonly ISender _sender = sender;
        private readonly ChatGPT_Service _chatGPTService = chatGPTService;
        private readonly IAccountAccessor _accountAccessor = accountAccessor;
        private readonly IQuestionReadRepository _questionReadRepository = questionReadRepository;
        private readonly IApplicationSettings _applicationSettings = applicationSettings;

        private readonly static Dictionary<string, string> _prompts = new (){
            { Languages.EN, "Please solve the question in the image!" },
            { Languages.TR, "Resimdeki soruyu çözer misin?" },
        };

        public async Task<CreateSolutionResponseDto> Handle(CreateSolutionByAIDto request, CancellationToken cancellationToken)
        {
            var question =
                await _questionReadRepository.GetQuestionWithImagesById(request.QuestionId, cancellationToken) ??
                throw new QuestionNotFoundException();

            var response = await _chatGPTService.SendAsync(Create(request.Model, question));

            return await _sender.Send(new CreateSolutionDto(response.Choices.First().Message.Content, request.QuestionId,new FormFileCollection()),cancellationToken);
        }

        private ChatGPT_Request Create(string model, Question question)
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

            if (question.Medias.Count == 1 && question.Medias[0].MultimediaType == MultimediaType.Image)
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

            throw new NotSolvableByAI();
        }

        private string GetUrl(string ContainerName, string blobName)
            => $"{_applicationSettings.BlobUrl}/{ContainerName}/{blobName}";

    }
}
