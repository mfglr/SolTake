using MySocailApp.Application.Queries.SubjectAggregate;
using SolTake.Core;

namespace MySocailApp.Application.QueryRepositories
{
    public interface ISubjectQueryRepository
    {
        Task<List<SubjectResponseDto>> GetExamSubjectsAsync(int examId, IPage page, CancellationToken cancellationToken);
    }
}
