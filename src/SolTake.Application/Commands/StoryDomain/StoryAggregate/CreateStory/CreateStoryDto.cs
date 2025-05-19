using MediatR;
using Microsoft.AspNetCore.Http;

namespace MySocailApp.Application.Commands.StoryDomain.StoryAggregate.CreateStory
{
    public record CreateStoryDto(IFormFileCollection Medias) : IRequest<List<CreateStoryResponseDto>>;
}
