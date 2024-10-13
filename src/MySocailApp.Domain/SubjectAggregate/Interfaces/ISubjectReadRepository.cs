using MySocailApp.Domain.SubjectAggregate.Entities;

namespace MySocailApp.Domain.SubjectAggregate.Interfaces
{
    public interface ISubjectReadRepository
    {
        Task<Subject?> GetByIdAsync(int subjectId, CancellationToken cancellationToken);
        Task<Subject?> GetSubjectWithTopicByIdAsync(int subjectId,int topicId,CancellationToken cancellationToken);
    }
}
