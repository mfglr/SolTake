using MySocailApp.Application.Queries.UserDomain;
using MySocailApp.Core;

namespace MySocailApp.Application.QueryRepositories
{
    public interface IUserUserBlockQueryRepository
    {
        Task<List<UserUserBlockResponseDto>> GetBlockedsByUserId(int userId, IPage page, CancellationToken cancellationToken);
    }
}
