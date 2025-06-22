using Microsoft.EntityFrameworkCore;
using SolTake.Application.Queries.UserDomain;
using SolTake.Application.QueryRepositories;
using SolTake.Infrastructure.DbContexts;
using SolTake.Infrastructure.Extentions;
using SolTake.Infrastructure.QueryRepositories.QueryableMappers;
using SolTake.Core;

namespace SolTake.Infrastructure.QueryRepositories
{
    internal class UserUserBlockQueryRepository(AppDbContext context) : IUserUserBlockQueryRepository
    {
        private readonly AppDbContext _context = context;

        public Task<List<UserUserBlockResponseDto>> GetBlockedsByUserId(int userId, IPage page, CancellationToken cancellationToken)
            => _context.UserUserBlocks
                .AsNoTracking()
                .Where(x => x.BlockerId == userId)
                .ToPage(page)
                .ToUserUserBlockResponseDto(_context)
                .ToListAsync(cancellationToken);
    }
}
