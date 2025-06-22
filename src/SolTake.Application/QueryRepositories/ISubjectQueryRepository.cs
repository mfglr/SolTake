using SolTake.Application.Queries.SubjectAggregate;
using SolTake.Core;

namespace SolTake.Application.QueryRepositories
{
    public interface ISubjectQueryRepository
    {
        Task<List<SubjectResponseDto>> GetExamSubjectsAsync(int examId, IPage page, CancellationToken cancellationToken);
        Task<List<SubjectResponseDto>> SearchSubjectsAsync(string? key, IPage page, CancellationToken cancellationToken);
    }
}
