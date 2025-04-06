using MySocailApp.Application.Queries.StoryDomain;
using MySocailApp.Core;

namespace MySocailApp.Application.QueryRepositories
{
    public interface IStoryUserViewQueryRepository
    {
        Task<List<StoryUserViewResponseDto>> GetStoryUserViewsByStoryId(int storyId, IPage page, CancellationToken cancellationToken);
    }
}
