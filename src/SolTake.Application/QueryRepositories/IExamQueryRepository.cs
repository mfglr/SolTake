using SolTake.Application.Queries.ExamAggregate;
using SolTake.Core;

namespace SolTake.Application.QueryRepositories
{
    public interface IExamQueryRepository
    {
        Task<ExamResponseDto?> GetExamByIdAsync(int id,CancellationToken cancellationToken);
        Task<List<ExamResponseDto>> GetAllAsync(CancellationToken cancellationToken);
        Task<List<ExamResponseDto>> SearchAsync(string? key, IPage page, CancellationToken cancellationToken);
    }
}
