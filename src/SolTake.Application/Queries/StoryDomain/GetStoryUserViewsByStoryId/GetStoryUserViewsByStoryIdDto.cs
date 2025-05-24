using MediatR;
using SolTake.Core;

namespace SolTake.Application.Queries.StoryDomain.GetStoryUserViewsByStoryId
{
    public record GetStoryUserViewsByStoryIdDto(int StoryId, int? Offset, int Take, bool IsDescending) : Page(Offset, Take, IsDescending), IRequest<List<StoryUserViewResponseDto>>;
}
