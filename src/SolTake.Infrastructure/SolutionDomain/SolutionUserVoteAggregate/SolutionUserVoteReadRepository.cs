using Microsoft.EntityFrameworkCore;
using MySocailApp.Domain.SolutionUserVoteAggregate.Abstracts;
using MySocailApp.Infrastructure.DbContexts;

namespace MySocailApp.Infrastructure.SolutionDomain.SolutionUserVoteAggregate
{
    public class SolutionUserVoteReadRepository(AppDbContext context) : ISolutionUserVoteReadRepository
    {
        private readonly AppDbContext _context = context;

        public Task<bool> ExistAsync(int solutionId, int userId, CancellationToken cancellationToken)
            => _context.SolutionUserVotes.AnyAsync(x => x.SolutionId == solutionId && x.UserId == userId,cancellationToken);
    }
}
