using MySocailApp.Application.Queries.UserDomain;
using MySocailApp.Application.Queries.UserDomain.SearchUsers;
using MySocailApp.Core;

namespace MySocailApp.Application.QueryRepositories
{
    public interface IUserQueryRepository
    {
        Task<UserResponseDto?> GetByIdAsync(int id, int? forUserId, CancellationToken cancellationToken);
        Task<UserResponseDto?> GetByUserNameAsync(string userName, int? forUserId, CancellationToken cancellationToken);
        Task<List<SearchUserResponseDto>> SearchUserAsync(string key, int? forUserId, IPage page, CancellationToken cancellationToken);
    }
}
