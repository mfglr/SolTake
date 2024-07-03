using Microsoft.EntityFrameworkCore;
using MySocailApp.Application.Services;
using MySocailApp.Domain.AppUserAggregate;
using MySocailApp.Infrastructure.DbContexts;

namespace MySocailApp.Infrastructure.AppUserAggregate
{
    public class AppUserReadRepository(AppDbContext context, IAccessTokenReader accessTokenReader) : IAppUserReadRepository
    {
        private readonly AppDbContext _context = context;
        private readonly IAccessTokenReader _accessTokenReader = accessTokenReader;

        public async Task<List<AppUser>> GetFollowersById(string id, CancellationToken cancellationToken, string lastId = "")
        {
            return await _context
                .AppUsers
                .AsNoTracking()
                .Include(x => x.Posts)
                .Include(x => x.Followers)
                .Include(x => x.Followeds)
                .Where(
                    user =>
                        user.Followeds.Any(follow => follow.FollowedId == id) &&
                        !user.IsRemoved &&
                        user.Id.CompareTo(lastId) > 0
                )
                .OrderBy(x => x.Id)
                .Take(20)
                .ToListAsync(cancellationToken);
        }

        public async Task<List<AppUser>> GetFollowedsById(string id, CancellationToken cancellationToken, string lastId = "")
        {
            return await _context
                .AppUsers
                .AsNoTracking()
                .Include(x => x.Posts)
                .Include(x => x.Followers)
                .Include(x => x.Followeds)
                .Where(
                    user =>
                        user.Followers.Any(follow => follow.FollowerId == id) &&
                        !user.IsRemoved &&
                        user.Id.CompareTo(lastId) > 0
                )
                .OrderBy(x => x.Id)
                .Take(20)
                .ToListAsync(cancellationToken);
        }

        public async Task<AppUser?> GetByIdAsync(string id, CancellationToken cancellationToken)
        {
            var accountId = _accessTokenReader.GetAccountId();

            return await _context
                .AppUsers
                .AsNoTracking()
                .Include(x => x.Posts)
                .Include(x => x.Followers)
                .Include(x => x.Followeds)
                .FirstOrDefaultAsync(
                    x => x.Id == id && !x.IsRemoved && !x.Blockeds.Any(x => x.BlockedId == accountId), 
                    cancellationToken
                );
        }
    }
}
