using Microsoft.EntityFrameworkCore;
using SolTake.Domain.SolutionUserVoteAggregate.Abstracts;
using SolTake.Infrastructure.DbContexts;

namespace SolTake.Infrastructure.SolutionDomain.SolutionUserVoteAggregate
{
    internal class SolutionUserVoteReadRepository(AppDbContext context) : ISolutionUserVoteReadRepository
    {
        private readonly AppDbContext _context = context;

        public Task<bool> ExistAsync(int solutionId, int userId, CancellationToken cancellationToken)
            => _context.SolutionUserVotes.AnyAsync(x => x.SolutionId == solutionId && x.UserId == userId,cancellationToken);
    }
}
