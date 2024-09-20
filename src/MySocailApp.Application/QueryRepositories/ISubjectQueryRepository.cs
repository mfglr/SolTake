using MySocailApp.Application.Queries.SubjectAggregate;
using MySocailApp.Core;

namespace MySocailApp.Application.QueryRepositories
{
    public interface ISubjectQueryRepository
    {
        Task<List<SubjectResponseDto>> GetExamSubjectsAsync(int examId, IPage page, CancellationToken cancellationToken);
    }
}
