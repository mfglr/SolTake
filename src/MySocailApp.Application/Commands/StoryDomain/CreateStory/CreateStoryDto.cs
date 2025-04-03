using MediatR;
using Microsoft.AspNetCore.Http;

namespace MySocailApp.Application.Commands.StoryDomain.CreateStory
{
    public record CreateStoryDto(IFormFileCollection Medias) : IRequest<List<CreateStoryResponseDto>>;
}
