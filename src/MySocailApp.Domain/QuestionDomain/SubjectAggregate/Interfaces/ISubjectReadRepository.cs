using MySocailApp.Domain.QuestionDomain.SubjectAggregate.Entities;

namespace MySocailApp.Domain.QuestionDomain.SubjectAggregate.Interfaces
{
    public interface ISubjectReadRepository
    {
        Task<Subject?> GetByIdAsync(int id, CancellationToken cancellationToken);
    }
}
