using SolTake.Application.Queries.UserDomain;
using SolTake.Core;

namespace SolTake.Application.QueryRepositories
{
    public interface IUserUserSearchQueryRepository
    {
        Task<List<UserUserSearchResponseDto>> GetUsersSearched(int userId, int forUserId, IPage page, CancellationToken cancellationToken);
    }
}
