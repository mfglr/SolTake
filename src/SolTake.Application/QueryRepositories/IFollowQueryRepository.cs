using MySocailApp.Application.Queries.UserDomain.GetFollowedsByUserId;
using SolTake.Core;

namespace SolTake.Application.QueryRepositories
{
    public interface IFollowQueryRepository
    {
        Task<FollowResponseDto?> GetFollowerAsync(int followId, int accountId, CancellationToken cancellationToken);
        Task<List<FollowResponseDto>> GetFollowersByUserIdAsync(int userId, IPage page, int accountId, CancellationToken cancellationToken);
        Task<List<FollowResponseDto>> GetFollowedsByUserIdAsync(int userId, IPage page, int accountId, CancellationToken cancellationToken);
    }
}
