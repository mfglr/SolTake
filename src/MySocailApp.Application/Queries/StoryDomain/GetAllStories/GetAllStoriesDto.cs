using MediatR;
using MySocailApp.Core;

namespace MySocailApp.Application.Queries.StoryDomain.GetAllStories
{
    public class GetAllStoriesDto(int? offset, int take, bool isDescending) : Page(offset, take, isDescending), IRequest<List<StoryResponseDto>>;
}
