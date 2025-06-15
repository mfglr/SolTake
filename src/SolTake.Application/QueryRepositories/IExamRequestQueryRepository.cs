using SolTake.Application.Queries.ExamRequestAggregate;
using SolTake.Core;

namespace SolTake.Application.QueryRepositories
{
    public interface IExamRequestQueryRepository
    {
        Task<List<ExamRequestResponseDto>> GetExamRequestsByUserIdAsync(int userId, IPage page, CancellationToken cancellationToken);
    }
}
