using MediatR;
using MySocailApp.Core;

namespace MySocailApp.Application.Queries.StoryDomain.GetStories
{
    public class GetStoriesDto(int? offset, int take, bool isDescending) : Page(offset, take, isDescending), IRequest<List<StoryResponseDto>>;
}
