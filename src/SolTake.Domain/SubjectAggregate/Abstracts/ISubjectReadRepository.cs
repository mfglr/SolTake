using SolTake.Domain.SubjectAggregate.Entities;

namespace SolTake.Domain.SubjectAggregate.Abstracts
{
    public interface ISubjectReadRepository
    {
        Task<Subject?> GetByIdAsync(int id, CancellationToken cancellationToken);
        Task<bool> ExistAsync(int id, CancellationToken cancellationToken);
    }
}
