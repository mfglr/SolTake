using SolTake.Application.Queries.ExamAggregate;

namespace SolTake.Application.QueryRepositories
{
    public interface IExamQueryRepository
    {
        Task<ExamResponseDto?> GetExamByIdAsync(int id,CancellationToken cancellationToken);
        Task<List<ExamResponseDto>> GetAllAsync(CancellationToken cancellationToken);
    }
}
