using MediatR;
using MySocailApp.Core;

namespace MySocailApp.Application.Queries.StoryDomain.GetAllStories
{
    public record GetAllStoriesDto(int? Offset, int Take, bool IsDescending) : Page(Offset, Take, IsDescending), IRequest<List<StoryResponseDto>>;
}
