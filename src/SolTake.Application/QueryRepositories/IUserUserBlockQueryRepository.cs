using SolTake.Application.Queries.UserDomain;
using SolTake.Core;

namespace SolTake.Application.QueryRepositories
{
    public interface IUserUserBlockQueryRepository
    {
        Task<List<UserUserBlockResponseDto>> GetBlockedsByUserId(int userId, IPage page, CancellationToken cancellationToken);
    }
}
