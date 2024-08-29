using MySocailApp.Application.Queries.UserAggregate;
using MySocailApp.Core;

namespace MySocailApp.Application.ApplicationServices.QueryRepositories
{
    public interface IAppUserQueryRepository
    {
        Task<AppUserResponseDto?> GetByIdAsync(int id, int accountId, CancellationToken cancellationToken);
        Task<AppUserResponseDto?> GetByUserNameAsync(string userName, int accountId, CancellationToken cancellationToken);
        Task<List<AppUserResponseDto>> GetNotFollowedsAsync(int userId, int accountId, IPage page, CancellationToken cancellationToken);
        Task<List<AppUserResponseDto>> SearchUserAsync(string key, int accountId, IPage page, CancellationToken cancellationToken);
    }
}
