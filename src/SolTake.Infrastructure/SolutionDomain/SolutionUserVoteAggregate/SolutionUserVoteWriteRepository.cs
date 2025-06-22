using Microsoft.EntityFrameworkCore;
using SolTake.Domain.SolutionUserVoteAggregate.Abstracts;
using SolTake.Domain.SolutionUserVoteAggregate.Entities;
using SolTake.Infrastructure.DbContexts;

namespace SolTake.Infrastructure.SolutionDomain.SolutionUserVoteAggregate
{
    internal class SolutionUserVoteWriteRepository(AppDbContext context) : ISolutionUserVoteWriteRepository
    {
        private readonly AppDbContext _context = context;

        public async Task CreateAsync(SolutionUserVote vote, CancellationToken cancellationToken)
            => await _context.SolutionUserVotes.AddAsync(vote, cancellationToken);

        public void Delete(SolutionUserVote vote)
            => _context.SolutionUserVotes.Remove(vote);

        public void DeleteRange(IEnumerable<SolutionUserVote> votes)
            => _context.RemoveRange(votes);

        public Task<SolutionUserVote?> GetAsync(int solutionId, int userId, CancellationToken cancellationToken)
            => _context.SolutionUserVotes.FirstOrDefaultAsync(x => x.SolutionId == solutionId && x.UserId == userId,cancellationToken);

        public Task<List<SolutionUserVote>> GetAsync(IEnumerable<int> solutionIds, int userId, CancellationToken cancellationToken)
            => _context.SolutionUserVotes
                .Where(x => solutionIds.Contains(x.SolutionId) && x.UserId == userId)
                .ToListAsync(cancellationToken);

        public Task<List<SolutionUserVote>> GetByUserIdAsync(int userId, CancellationToken cancellationToken)
            => _context.SolutionUserVotes
                .Where(x => x.UserId == userId)
                .ToListAsync(cancellationToken);
    }
}
