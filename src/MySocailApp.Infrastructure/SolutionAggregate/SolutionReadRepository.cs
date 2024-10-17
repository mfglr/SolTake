using Microsoft.EntityFrameworkCore;
using MySocailApp.Domain.SolutionAggregate.Entities;
using MySocailApp.Domain.SolutionAggregate.Interfaces;
using MySocailApp.Domain.SolutionAggregate.ValueObjects;
using MySocailApp.Infrastructure.DbContexts;

namespace MySocailApp.Infrastructure.SolutionAggregate
{
    public class SolutionReadRepository(AppDbContext context) : ISolutionReadRepository
    {
        private readonly AppDbContext _context = context;

        public async Task<bool> Exist(int id, CancellationToken cancellationToken)
            => await _context.Solutions.AnyAsync(x => x.Id == id, cancellationToken);

        public async Task<Solution?> GetAsync(int id, CancellationToken cancellationToken)
            => await _context.Solutions
                .AsNoTracking()
                .FirstOrDefaultAsync(x => x.Id == id, cancellationToken);

        public async Task<Solution?> GetSolutionWithImagesByIdAsync(int id,CancellationToken cancellationToken)
            => await _context.Solutions
                .AsNoTracking()
                .Include(x => x.Images)
                .FirstOrDefaultAsync(x => x.Id == id, cancellationToken);

        public async Task<int> GetNumberOfQuestionCorrectSolutionsAsync(int questionId, CancellationToken cancellationToken)
            => await _context.Solutions
                .CountAsync(x => x.QuestionId == questionId && x.State == SolutionState.Correct, cancellationToken);
    }
}
