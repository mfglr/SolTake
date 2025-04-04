using MySocailApp.Application.Queries.StoryDomain;
using MySocailApp.Core;

namespace MySocailApp.Application.QueryRepositories
{
    public interface IStoryQueryRepository
    {
        Task<List<StoryResponseDto>> GetStoriesByUserId(int UserId, IPage page,CancellationToken cancellationToken);
    }
}
