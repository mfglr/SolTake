using SolTake.Domain.SubjectAggregate.Entities;

namespace SolTake.Domain.SubjectAggregate.Abstracts
{
    public interface ISubjectWriteRepository
    {
        Task CreateListAsync(IEnumerable<Subject> subjects,CancellationToken cancellationToken);
    }
}
