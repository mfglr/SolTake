using SolTake.Domain.SubjectAggregate.Abstracts;
using SolTake.Domain.SubjectAggregate.Entities;
using SolTake.Infrastructure.DbContexts;

namespace SolTake.Infrastructure.SubjectAggregate
{
    public class SubjectWriteRepository(AppDbContext context) : ISubjectWriteRepository
    {
        private readonly AppDbContext _context = context;

        public Task CreateListAsync(IEnumerable<Subject> subjects, CancellationToken cancellationToken)
            => _context.Subjects.AddRangeAsync(subjects, cancellationToken);
    }
}
