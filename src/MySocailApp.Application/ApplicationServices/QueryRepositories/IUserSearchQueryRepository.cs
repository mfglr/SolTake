using MySocailApp.Application.Queries.UserAggregate;
using MySocailApp.Core;

namespace MySocailApp.Application.ApplicationServices.QueryRepositories
{
    public interface IUserSearchQueryRepository
    {
        Task<List<UserSearchResponseDto>> GetUserSearcheds(int userId, int accuntId, IPage page, CancellationToken cancellationToken);
    }
}
