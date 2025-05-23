using MySocailApp.Application.Queries.SubjectAggregate;
using SolTake.Core;

namespace SolTake.Application.QueryRepositories
{
    public interface ISubjectQueryRepository
    {
        Task<List<SubjectResponseDto>> GetExamSubjectsAsync(int examId, IPage page, CancellationToken cancellationToken);
    }
}
