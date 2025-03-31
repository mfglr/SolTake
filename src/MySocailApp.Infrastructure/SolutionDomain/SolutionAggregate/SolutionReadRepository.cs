using Microsoft.EntityFrameworkCore;
using MySocailApp.Domain.SolutionDomain.SolutionAggregate.Abstracts;
using MySocailApp.Domain.SolutionDomain.SolutionAggregate.Entities;
using MySocailApp.Domain.SolutionDomain.SolutionAggregate.ValueObjects;
using MySocailApp.Infrastructure.DbContexts;

namespace MySocailApp.Infrastructure.SolutionDomain.SolutionAggregate
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

        public async Task<Solution?> GetSolutionWithImagesByIdAsync(int id, CancellationToken cancellationToken)
            => await _context.Solutions
                .AsNoTracking()
                .Include(x => x.Medias)
                .FirstOrDefaultAsync(x => x.Id == id, cancellationToken);

        public async Task<int> GetNumberOfQuestionCorrectSolutionsAsync(int questionId, CancellationToken cancellationToken)
            => await _context.Solutions
                .CountAsync(x => x.QuestionId == questionId && x.State == SolutionState.Correct, cancellationToken);

        public Task<int> GetSolutionUserId(int id, CancellationToken cancellationToken)
            => _context.Solutions.Where(x => x.Id == id).Select(x => x.UserId).FirstOrDefaultAsync(cancellationToken);
    }
}
