using Microsoft.EntityFrameworkCore;
using MySocailApp.Application.Queries.SolutionDomain;
using MySocailApp.Application.QueryRepositories;
using MySocailApp.Infrastructure.DbContexts;
using MySocailApp.Infrastructure.Extentions;
using MySocailApp.Infrastructure.QueryRepositories.QueryableMappers;
using SolTake.Core;

namespace MySocailApp.Infrastructure.QueryRepositories
{
    public class SolutionUserSaveQueryRepository(AppDbContext context) : ISolutionUserSaveQueryRepository
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
