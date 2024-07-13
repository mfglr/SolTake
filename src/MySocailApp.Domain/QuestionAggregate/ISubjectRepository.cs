using MySocailApp.Domain.SubjectAggregate;

namespace MySocailApp.Domain.QuestionAggregate
{
    public interface ISubjectRepository
    {
        Task<Subject> GetAsync(int id, IEnumerable<int> topicIds, CancellationToken cancellationToken);
    }
}
