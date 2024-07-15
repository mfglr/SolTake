using Microsoft.EntityFrameworkCore;
using MySocailApp.Domain.SubjectAggregate;
using MySocailApp.Infrastructure.DbContexts;

namespace MySocailApp.Infrastructure.SubjectAggregate
{
    public class SubjectReadRepository(AppDbContext context) : ISubjectReadRepository
    {
        private readonly AppDbContext _context = context;

        public async Task<List<Subject>> GetByExamIdAsync(int examId,CancellationToken cancellationToken)
            => await _context.Subjects.AsNoTracking().Where(x => x.ExamId == examId).ToListAsync(cancellationToken);
    }
}
