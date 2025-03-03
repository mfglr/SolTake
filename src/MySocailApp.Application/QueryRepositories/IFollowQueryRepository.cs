using MySocailApp.Application.Queries.UserDomain.GetFollowedsByUserId;
using MySocailApp.Application.Queries.UserDomain.GetFollowersByUserId;
using MySocailApp.Core;

namespace MySocailApp.Application.QueryRepositories
{
    public interface IFollowQueryRepository
    {
        Task<FollowerResponseDto?> GetFollowerAsync(int followId, int accountId, CancellationToken cancellationToken);
        Task<List<FollowerResponseDto>> GetFollowersByUserIdAsync(int userId, IPage page, int accountId, CancellationToken cancellationToken);
        Task<List<FollowedResponseDto>> GetFollowedsByUserIdAsync(int userId, IPage page, int accountId, CancellationToken cancellationToken);
    }
}
