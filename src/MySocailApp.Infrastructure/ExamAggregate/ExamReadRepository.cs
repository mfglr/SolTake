using Microsoft.EntityFrameworkCore;
using MySocailApp.Domain.ExamAggregate;
using MySocailApp.Infrastructure.DbContexts;

namespace MySocailApp.Infrastructure.ExamAggregate
{
    public class ExamReadRepository(AppDbContext context) : IExamReadRepository
    {
        private readonly AppDbContext _context = context;

        public async Task<List<Exam>> GetAllAsync(CancellationToken cancellationToken)
            => await _context.Exams.AsNoTracking().ToListAsync(cancellationToken);
    }
}
