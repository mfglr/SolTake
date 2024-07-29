using Microsoft.EntityFrameworkCore;
using MySocailApp.Domain.SubjectAggregate.Entities;
using MySocailApp.Domain.SubjectAggregate.Interfaces;
using MySocailApp.Infrastructure.DbContexts;

namespace MySocailApp.Infrastructure.SubjectAggregate
{
    public class SubjectReadRepository(AppDbContext context) : ISubjectReadRepository
    {
        private readonly AppDbContext _context = context;

        public async Task<Subject?> GetByIdAsync(int id, CancellationToken cancellationToken) =>
            await _context.Subjects.AsNoTracking().FirstOrDefaultAsync(x => x.Id == id, cancellationToken);
        public async Task<List<Subject>> GetByExamIdAsync(int examId,CancellationToken cancellationToken)
            => await _context.Subjects.AsNoTracking().Where(x => x.ExamId == examId).ToListAsync(cancellationToken);
    }
}
