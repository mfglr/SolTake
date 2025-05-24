using MediatR;

namespace SolTake.Application.Queries.StoryDomain.GetStories
{
    public record GetStoriesDto : IRequest<List<StoryResponseDto>>;
}
