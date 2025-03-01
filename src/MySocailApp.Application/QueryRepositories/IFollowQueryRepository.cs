using MySocailApp.Application.Queries.UserDomain.FollowAggregate;
using MySocailApp.Core;

namespace MySocailApp.Application.QueryRepositories
{
    public interface IFollowQueryRepository
    {
        Task<FollowerResponseDto?> GetFollowerAsync(int followId, CancellationToken cancellationToken);
        Task<List<FollowerResponseDto>> GetFollowersByUserIdAsync(int userId, IPage page, CancellationToken cancellationToken);
        Task<List<FollowedResponseDto>> GetFollowedsByUserIdAsync(int userId, IPage page, CancellationToken cancellationToken);
    }
}
