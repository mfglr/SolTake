using MySocailApp.Application.Queries.UserDomain;
using SolTake.Core;

namespace MySocailApp.Application.QueryRepositories
{
    public interface IUserUserBlockQueryRepository
    {
        Task<List<UserUserBlockResponseDto>> GetBlockedsByUserId(int userId, IPage page, CancellationToken cancellationToken);
    }
}
