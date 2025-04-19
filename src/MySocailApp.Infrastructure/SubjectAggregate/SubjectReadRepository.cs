using Microsoft.EntityFrameworkCore;
using MySocailApp.Domain.SubjectAggregate.Entities;
using MySocailApp.Domain.SubjectAggregate.Interfaces;
using MySocailApp.Infrastructure.DbContexts;

namespace MySocailApp.Infrastructure.SubjectAggregate
{
    public class SubjectReadRepository(AppDbContext context) : ISubjectReadRepository
    {
        private readonly AppDbContext _context = context;

        public Task<Subject?> GetByIdAsync(int id, CancellationToken cancellationToken)
            => _context.Subjects
                .AsNoTracking()
                .Include(x => x.Topics)
                .FirstOrDefaultAsync(x => x.Id == id, cancellationToken);
    }
}
