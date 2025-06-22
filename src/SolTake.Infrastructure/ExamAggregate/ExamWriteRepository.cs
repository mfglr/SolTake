using SolTake.Domain.ExamAggregate.Entitities;
using SolTake.Domain.ExamAggregate.Interfaces;
using SolTake.Infrastructure.DbContexts;

namespace SolTake.Infrastructure.ExamAggregate
{
    internal class ExamWriteRepository(AppDbContext context) : IExamWriteRepository
    {
        private readonly AppDbContext _context = context;

        public async Task CreateAsync(Exam exam, CancellationToken cancellationToken)
            => await _context.Exams.AddAsync(exam,cancellationToken);
    }
}
