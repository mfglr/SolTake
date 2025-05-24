using Microsoft.EntityFrameworkCore;
using SolTake.Application.Queries.SolutionDomain;
using SolTake.Application.QueryRepositories;
using SolTake.Domain.SolutionAggregate.ValueObjects;
using SolTake.Infrastructure.DbContexts;
using SolTake.Infrastructure.Extentions;
using SolTake.Infrastructure.QueryRepositories.QueryableMappers;
using SolTake.Core;

namespace SolTake.Infrastructure.QueryRepositories
{
    public class SolutionUserVoteQueryRepository(AppDbContext context) : ISolutionUserVoteQueryRepository
    {
        private readonly AppDbContext _context = context;

        public Task<List<SolutionUserVoteResponseDto>> GetSolutionUpvotes(IPage page, int solutionId, CancellationToken cancellationToken)
            => _context.SolutionUserVotes
                .AsNoTracking()
                .Where(x => x.SolutionId == solutionId && x.Type == SolutionVoteType.Upvote)
                .ToPage(page)
                .ToSolutionUserVoteDto(_context)
                .ToListAsync(cancellationToken);

        public Task<List<SolutionUserVoteResponseDto>> GetSolutionDownvotes(IPage page, int solutionId, CancellationToken cancellationToken)
            => _context.SolutionUserVotes
                .AsNoTracking()
                .Where(x => x.SolutionId == solutionId && x.Type == SolutionVoteType.Downvote)
                .ToPage(page)
                .ToSolutionUserVoteDto(_context)
                .ToListAsync(cancellationToken);

        public async Task<SolutionUserVoteResponseDto?> GetSolutionVote(int voteId, CancellationToken cancellationToken)
            => await _context.SolutionUserVotes
                .AsNoTracking()
                .Where(x => x.Id == voteId)
                .ToSolutionUserVoteDto(_context)
                .FirstOrDefaultAsync(cancellationToken);
    }
}
