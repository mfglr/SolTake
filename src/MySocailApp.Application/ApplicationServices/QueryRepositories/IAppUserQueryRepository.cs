using MySocailApp.Application.Queries.UserAggregate;
using MySocailApp.Core;

namespace MySocailApp.Application.ApplicationServices.QueryRepositories
{
    public interface IAppUserQueryRepository
    {
        Task<List<AppUserResponseDto>> GetLikesByQuestionIdAsync(int questionId, int accountId, IPagination pagination, CancellationToken cancellationToken);
    }
}
