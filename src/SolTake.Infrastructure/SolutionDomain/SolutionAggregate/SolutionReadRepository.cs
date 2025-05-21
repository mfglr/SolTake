using Microsoft.EntityFrameworkCore;
using MySocailApp.Domain.SolutionAggregate.Entities;
using SolTake.Domain.SolutionAggregate.ValueObjects;
using MySocailApp.Infrastructure.DbContexts;
using SolTake.Domain.SolutionAggregate.Abstracts;

namespace MySocailApp.Infrastructure.SolutionDomain.SolutionAggregate
{
    public class SolutionReadRepository(AppDbContext context) : ISolutionReadRepository
    {
        private readonly AppDbContext _context = context;

        public Task<bool> Exist(int id, CancellationToken cancellationToken)
            => _context.Solutions
                .AsNoTracking()
                .AnyAsync(x => x.Id == id, cancellationToken);

        public Task<Solution?> GetAsync(int id, CancellationToken cancellationToken)
            => _context.Solutions
                .AsNoTracking()
                .FirstOrDefaultAsync(x => x.Id == id, cancellationToken);

        public Task<int> GetNumberOfQuestionCorrectSolutionsAsync(int questionId, CancellationToken cancellationToken)
            => _context.Solutions
                .AsNoTracking()
                .CountAsync(x => x.QuestionId == questionId && x.State == SolutionState.Correct, cancellationToken);

        public Task<int> GetSolutionUserId(int id, CancellationToken cancellationToken)
            => _context.Solutions
                .AsNoTracking()
                .Where(x => x.Id == id)
                .Select(x => x.UserId)
                .FirstOrDefaultAsync(cancellationToken);

        public Task<List<int>> GetSolutionIdsOfUser(int userId, CancellationToken cancellationToken)
            => _context.Solutions
                .AsNoTracking()
                .Where(x => x.UserId == userId)
                .Select(x => x.Id)
                .ToListAsync(cancellationToken);
    }
}
