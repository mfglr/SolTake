using Microsoft.EntityFrameworkCore;
using SolTake.Domain.SubjectAggregate.Abstracts;
using SolTake.Domain.SubjectAggregate.Entities;
using SolTake.Infrastructure.DbContexts;

namespace SolTake.Infrastructure.SubjectAggregate
{
    public class SubjectWriteRepository(AppDbContext context) : ISubjectWriteRepository
    {
        private readonly AppDbContext _context = context;

        public Task<Subject?> GetByIdAsync(int id, CancellationToken cancellationToken)
            => _context.Subjects.FirstOrDefaultAsync(x => x.Id == id,cancellationToken);
    }
}
