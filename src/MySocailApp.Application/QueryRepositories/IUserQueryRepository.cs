using MySocailApp.Application.Queries.UserDomain;
using MySocailApp.Application.Queries.UserDomain.SearchUsers;
using MySocailApp.Core;

namespace MySocailApp.Application.QueryRepositories
{
    public interface IUserQueryRepository
    {
        Task<UserResponseDto?> GetByIdAsync(int id, int accountId, CancellationToken cancellationToken);
        Task<UserResponseDto?> GetByUserNameAsync(string userName, int accountId, CancellationToken cancellationToken);
        Task<List<SearchUserResponseDto>> SearchUserAsync(string key, int accountId, IPage page, CancellationToken cancellationToken);
        Task<List<UserResponseDto>> GetCreateConversationPageUsersAsync(int accountId, IPage page, CancellationToken cancellationToken);
    }
}
