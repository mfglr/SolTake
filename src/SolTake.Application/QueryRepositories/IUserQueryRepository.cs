using SolTake.Application.Queries.UserDomain;
using SolTake.Application.Queries.UserDomain.SearchUsers;
using SolTake.Core;

namespace SolTake.Application.QueryRepositories
{
    public interface IUserQueryRepository
    {
        Task<UserResponseDto?> GetByIdAsync(int id, int? forUserId, CancellationToken cancellationToken);
        Task<UserResponseDto?> GetByUserNameAsync(string userName, int? forUserId, CancellationToken cancellationToken);
        Task<List<SearchUserResponseDto>> SearchUserAsync(string key, int? forUserId, IPage page, CancellationToken cancellationToken);
    }
}
