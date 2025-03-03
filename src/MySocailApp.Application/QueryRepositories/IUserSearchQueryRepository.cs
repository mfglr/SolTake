using MySocailApp.Application.Queries.UserDomain.GetUsersSearched;
using MySocailApp.Core;

namespace MySocailApp.Application.QueryRepositories
{
    public interface IUserSearchQueryRepository
    {
        Task<List<UserSearchedResponseDto>> GetUsersSearched(int userId, int accuntId, IPage page, CancellationToken cancellationToken);
    }
}
