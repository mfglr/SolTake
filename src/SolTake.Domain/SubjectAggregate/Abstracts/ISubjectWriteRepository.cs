using SolTake.Domain.SubjectAggregate.Entities;

namespace SolTake.Domain.SubjectAggregate.Abstracts
{
    public interface ISubjectWriteRepository
    {
        Task<Subject?> GetByIdAsync(int id, CancellationToken cancellationToken);
    }
}
