using Microsoft.EntityFrameworkCore;
using MySocailApp.Application.Queries.UserDomain;
using MySocailApp.Application.QueryRepositories;
using MySocailApp.Core;
using MySocailApp.Infrastructure.DbContexts;
using MySocailApp.Infrastructure.Extentions;
using MySocailApp.Infrastructure.QueryRepositories.QueryableMappers;

namespace MySocailApp.Infrastructure.QueryRepositories
{
    public class UserUserBlockQueryRepository(AppDbContext context) : IUserUserBlockQueryRepository
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
