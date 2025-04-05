using MySocailApp.Application.Queries.StoryDomain;
using MySocailApp.Core;

namespace MySocailApp.Application.QueryRepositories
{
    public interface IStoryQueryRepository
    {
        Task<List<StoryResponseDto>> GetStoriesByUserId(int UserId, CancellationToken cancellationToken);
        Task<List<StoryResponseDto>> GetAllStoriesByUserId(int userId, IPage page, CancellationToken cancellationToken);
    }
}
