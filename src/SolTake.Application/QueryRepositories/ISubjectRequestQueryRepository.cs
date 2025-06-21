using SolTake.Application.Queries.SubjectRequestAggregate;
using SolTake.Core;

namespace SolTake.Application.QueryRepositories
{
    public interface ISubjectRequestQueryRepository
    {
        Task<List<SubjectRequestResponseDto>> GetByUserId(int userId, IPage page, CancellationToken cancellationToken);
        Task<List<SubjectRequestResponseDto>> GetPendingsAsync(IPage page, CancellationToken cancellationToken);
    }
}
