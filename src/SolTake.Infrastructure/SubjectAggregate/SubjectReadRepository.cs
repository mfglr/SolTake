using Microsoft.EntityFrameworkCore;
using SolTake.Domain.SubjectAggregate.Abstracts;
using SolTake.Domain.SubjectAggregate.Entities;
using SolTake.Infrastructure.DbContexts;

namespace SolTake.Infrastructure.SubjectAggregate
{
    internal class SubjectReadRepository(AppDbContext context) : ISubjectReadRepository
    {
        private readonly AppDbContext _context = context;

        public Task<bool> ExistAsync(int id, CancellationToken cancellationToken)
            => _context.Subjects.AnyAsync(x => x.Id == id, cancellationToken);

        public Task<Subject?> GetByIdAsync(int id, CancellationToken cancellationToken)
            => _context.Subjects
                .AsNoTracking()
                .FirstOrDefaultAsync(x => x.Id == id, cancellationToken);
    }
}
