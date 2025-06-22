using Microsoft.EntityFrameworkCore;
using SolTake.Application.Queries.SolutionDomain;
using SolTake.Application.QueryRepositories;
using SolTake.Infrastructure.DbContexts;
using SolTake.Infrastructure.Extentions;
using SolTake.Infrastructure.QueryRepositories.QueryableMappers;
using SolTake.Core;

namespace SolTake.Infrastructure.QueryRepositories
{
    internal class SolutionUserSaveQueryRepository(AppDbContext context) : ISolutionUserSaveQueryRepository
    {
        private readonly AppDbContext _context = context;

        public Task<List<SolutionUserSaveResponseDto>> GetSolutionUserSaves(int userId, int accountId, IPage page, CancellationToken cancellationToken)
            => _context.SolutionUserSaves
                .AsNoTracking()
                .Where(x => x.UserId == userId)
                .ToPage(page)
                .ToSolutionUserSaveResponseDto(_context, accountId)
                .ToListAsync(cancellationToken);
    }
}
