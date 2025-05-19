using MySocailApp.Domain.SubjectAggregate.Entities;

namespace MySocailApp.Domain.SubjectAggregate.Interfaces
{
    public interface ISubjectReadRepository
    {
        Task<Subject?> GetByIdAsync(int id, CancellationToken cancellationToken);
    }
}
