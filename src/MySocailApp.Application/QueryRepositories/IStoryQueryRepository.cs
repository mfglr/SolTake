using MySocailApp.Application.Queries.StoryDomain;
using MySocailApp.Core;

namespace MySocailApp.Application.QueryRepositories
{
    public interface IStoryQueryRepository
    {
        Task<List<StoryResponseDto>> GetStoriesByUserId(int userId, int? forUserId, CancellationToken cancellationToken);
        Task<List<StoryResponseDto>> GetAllStoriesByUserId(int userId, int? forUserId, IPage page, CancellationToken cancellationToken);
        Task<List<StoryResponseDto>> GetActiveStoriesByUserId(int userId, int? forUserId, CancellationToken cancellationToken);
    }
}
