using MySocailApp.Application.Queries.UserAggregate;
using MySocailApp.Core;

namespace MySocailApp.Application.QueryRepositories
{
    public interface IAppUserQueryRepository
    {
        Task<UserResponseDto?> GetByIdAsync(int id, int accountId, CancellationToken cancellationToken);
        Task<UserResponseDto?> GetByUserNameAsync(string userName, int accountId, CancellationToken cancellationToken);
        Task<List<UserResponseDto>> GetNotFollowedsAsync(int userId, int accountId, IPage page, CancellationToken cancellationToken);
        Task<List<UserResponseDto>> SearchUserAsync(string key, int accountId, IPage page, CancellationToken cancellationToken);
        Task<List<UserResponseDto>> GetCreateConversationPageUsersAsync(int accountId, IPage page, CancellationToken cancellationToken);
    }
}
