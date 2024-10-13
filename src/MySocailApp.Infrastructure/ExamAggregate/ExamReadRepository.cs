using Microsoft.EntityFrameworkCore;
using MySocailApp.Domain.ExamAggregate.Entitities;
using MySocailApp.Domain.ExamAggregate.Interfaces;
using MySocailApp.Infrastructure.DbContexts;

namespace MySocailApp.Infrastructure.ExamAggregate
{
    public class ExamReadRepository(AppDbContext context) : IExamReadRepository
    {
        private readonly AppDbContext _context = context;

        public Task<Exam?> GetByIdAsync(int id, CancellationToken cancellationToken) =>
            _context.Exams
                .AsNoTracking()
                .FirstOrDefaultAsync(x => x.Id == id, cancellationToken);

        public Task<List<Exam>> GetAllAsync(CancellationToken cancellationToken)
            => _context.Exams.AsNoTracking().ToListAsync(cancellationToken);
        public Task<bool> Exist(int id, CancellationToken cancellationToken)
            => _context.Exams.AnyAsync(x => x.Id == id, cancellationToken);
    }

}