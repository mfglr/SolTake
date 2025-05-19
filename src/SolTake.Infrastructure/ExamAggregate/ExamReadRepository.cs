using Microsoft.EntityFrameworkCore;
using SolTake.Domain.ExamAggregate.Entitities;
using SolTake.Domain.ExamAggregate.Interfaces;
using MySocailApp.Infrastructure.DbContexts;

namespace MySocailApp.Infrastructure.ExamAggregate
{
    public class ExamReadRepository(AppDbContext context) : IExamReadRepository
    {
        private readonly AppDbContext _context = context;

        public async Task<Exam?> GetByIdAsync(int id, CancellationToken cancellationToken) =>
            await _context.Exams.AsNoTracking().FirstOrDefaultAsync(x => x.Id == id, cancellationToken);
        public async Task<List<Exam>> GetAllAsync(CancellationToken cancellationToken)
            => await _context.Exams.AsNoTracking().ToListAsync(cancellationToken);
    }

}