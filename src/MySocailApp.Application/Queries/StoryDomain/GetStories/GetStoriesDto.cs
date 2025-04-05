using MediatR;

namespace MySocailApp.Application.Queries.StoryDomain.GetStories
{
    public record GetStoriesDto : IRequest<List<StoryResponseDto>>;
}
