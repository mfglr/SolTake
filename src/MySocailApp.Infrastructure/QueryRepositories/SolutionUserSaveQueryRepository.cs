using Microsoft.EntityFrameworkCore;
using MySocailApp.Application.Queries.SolutionAggregate;
using MySocailApp.Application.QueryRepositories;
using MySocailApp.Core;
using MySocailApp.Infrastructure.DbContexts;
using MySocailApp.Infrastructure.Extetions;
using MySocailApp.Infrastructure.QueryRepositories.QueryableMappers;

namespace MySocailApp.Infrastructure.QueryRepositories
{
    public class SolutionUserSaveQueryRepository(AppDbContext context) : ISolutionUserSaveQueryRepository
    {
        private readonly AppDbContext _context = context;

        public Task<List<SolutionUserSaveResponseDto>> GetSavedSolutions(int userId, int accountId, IPage page, CancellationToken cancellationToken)
            => _context.SolutionUserSaves
                .AsNoTracking()
                .Where(x => x.AppUserId == userId)
                .ToPage(page)
                .ToSolutionUserSaveResponseDto(_context, accountId)
                .ToListAsync(cancellationToken);
    }
}
