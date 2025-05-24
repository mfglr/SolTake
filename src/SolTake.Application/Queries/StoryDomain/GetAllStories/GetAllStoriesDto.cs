using MediatR;
using SolTake.Core;

namespace SolTake.Application.Queries.StoryDomain.GetAllStories
{
    public record GetAllStoriesDto(int? Offset, int Take, bool IsDescending) : Page(Offset, Take, IsDescending), IRequest<List<StoryResponseDto>>;
}
