using Microsoft.EntityFrameworkCore;
using MySocailApp.Application.ApplicationServices.QueryRepositories;
using MySocailApp.Application.Queries.UserAggregate;
using MySocailApp.Core;
using MySocailApp.Infrastructure.DbContexts;
using MySocailApp.Infrastructure.Extetions;
using MySocailApp.Infrastructure.Extetions.QueryableMappers;

namespace MySocailApp.Infrastructure.ApplicationServices.QueryRepositories
{
    public class AppUserQueryRepository(AppDbContext context) : IAppUserQueryRepository
    {
        private readonly AppDbContext _context = context;

        public Task<AppUserResponseDto?> GetByIdAsync(int id, int accountId, CancellationToken cancellationToken)
            => _context.AppUsers
                .AsNoTracking()
                .Where(x => x.Id == id)
                .ToUserResponseDto(accountId)
                .FirstOrDefaultAsync(cancellationToken);

        public Task<AppUserResponseDto?> GetByUserNameAsync(string userName, int accountId, CancellationToken cancellationToken)
            => _context.AppUsers
                .AsNoTracking()
                .Where(x => x.Account.UserName == userName)
                .ToUserResponseDto(accountId)
                .FirstOrDefaultAsync(cancellationToken);
        public Task<List<AppUserResponseDto>> GetNotFollowedsAsync(int userId, int accountId, IPage page, CancellationToken cancellationToken)
            => _context.AppUsers
                .AsNoTracking()
                .Where(x => x.Id != userId && !x.Followers.Any(x => x.FollowerId == userId))
                .ToPage(page)
                .ToUserResponseDto(accountId)
                .ToListAsync(cancellationToken);

        public Task<List<AppUserResponseDto>> SearchUserAsync(string key, int accountId, IPage page, CancellationToken cancellationToken)
            => _context.AppUsers
                .AsNoTracking()
                .Where(
                    user =>
                        (
                            user.Name != null &&
                            user.Name.Contains(key, StringComparison.CurrentCultureIgnoreCase)
                        ) ||
                        user.Account.UserName!.Contains(key, StringComparison.CurrentCultureIgnoreCase)
                )
                .ToPage(page)
                .ToUserResponseDto(accountId)
                .ToListAsync(cancellationToken);
    }
}
