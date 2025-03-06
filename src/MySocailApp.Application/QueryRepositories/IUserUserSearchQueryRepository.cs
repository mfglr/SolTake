using MySocailApp.Application.Queries.UserDomain;
using MySocailApp.Core;

namespace MySocailApp.Application.QueryRepositories
{
    public interface IUserUserSearchQueryRepository
    {
        Task<List<UserUserSearchResponseDto>> GetUsersSearched(int userId, IPage page, CancellationToken cancellationToken);
    }
}
