using Microsoft.EntityFrameworkCore;
using MySocailApp.Domain.SolutionAggregate.Entities;
using MySocailApp.Domain.SolutionAggregate.Interfaces;
using MySocailApp.Infrastructure.DbContexts;

namespace MySocailApp.Infrastructure.SolutionAggregate
{
    public class SolutionWriteRepository(AppDbContext context) : ISolutionWriteRepository
    {
        private readonly AppDbContext _context = context;

        public async Task CreateAsync(Solution solution, CancellationToken cancellationToken)
            => await _context.AddAsync(solution, cancellationToken);

        public void Delete(Solution solution)
            => _context.Solutions.Remove(solution);

        public void DeleteRange(IEnumerable<Solution> solutions)
            => _context.Solutions.RemoveRange(solutions);

        public Task<Solution?> GetWithVoteByIdAsync(int solutionId, int voterId, CancellationToken cancellationToken)
            => _context.Solutions
                .Include(x => x.Votes.Where(x => x.AppUserId == voterId))
                .FirstOrDefaultAsync(x => x.Id == solutionId && !x.IsRemoved, cancellationToken);

        public Task<Solution?> GetWithVoteAndVoteNotificationByIdAsync(int solutionId, int voterId, CancellationToken cancellationToken)
            => _context.Solutions
                .Include(x => x.Votes.Where(x => x.AppUserId == voterId))
                .Include(x => x.VoteNotifications.Where(x => x.AppUserId == voterId))
                .FirstOrDefaultAsync(x => x.Id == solutionId && !x.IsRemoved, cancellationToken);

        public Task<Solution?> GetByIdAsync(int id, CancellationToken cancellationToken)
            => _context.Solutions
                .FirstOrDefaultAsync(x => x.Id == id && !x.IsRemoved, cancellationToken);

        public Task<Solution?> GetWithImagesByIdAsync(int id, CancellationToken cancellationToken)
            => _context.Solutions
                .Include(x => x.Images)
                .FirstOrDefaultAsync(x => x.Id == id && !x.IsRemoved, cancellationToken);

        public async Task<Solution?> GetWithCommentsByIdAsync(int id, CancellationToken cancellationToken)
            => await _context.Solutions
                .Include(x => x.Images)
                .Include(x => x.Comments)
                .ThenInclude(x => x.Children)
                .Include(x => x.Comments)
                .ThenInclude(x => x.Replies)
                .FirstOrDefaultAsync(x => x.Id == id, cancellationToken);
    }
}
