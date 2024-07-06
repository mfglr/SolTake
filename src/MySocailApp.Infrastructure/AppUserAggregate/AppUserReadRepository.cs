using Microsoft.EntityFrameworkCore;
using Microsoft.Identity.Client;
using MySocailApp.Application.Queries.UserAggregate.SearchUsers;
using MySocailApp.Application.Services;
using MySocailApp.Domain.AppUserAggregate;
using MySocailApp.Infrastructure.DbContexts;

namespace MySocailApp.Infrastructure.AppUserAggregate
{
    public class AppUserReadRepository(AppDbContext context, IAccessTokenReader accessTokenReader) : IAppUserReadRepository
    {
        private readonly AppDbContext _context = context;
        private readonly IAccessTokenReader _accessTokenReader = accessTokenReader;

        public async Task<List<AppUser>> GetFollowersByIdAsync(string id, CancellationToken cancellationToken, string lastId = "")
        {
            return await _context
                .AppUsers
                .AsNoTracking()
                .Include(x => x.Posts)
                .Include(x => x.Followers)
                .Include(x => x.Followeds)
                .Include(x => x.Requesters)
                .Include(x => x.Requesteds)
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

        public async Task<List<AppUser>> SearchUser(string key, CancellationToken cancellationToken, string lastId = "")
        {
            if (key == "") return [];
            var accountId = _accessTokenReader.GetAccountId();
            var keyLower = key.ToLower();
            
            return await _context
                .AppUsers
                .AsNoTracking()
                .Include(x => x.Posts)
                .Include(x => x.Followers)
                .Include(x => x.Followeds)
                .Include(x => x.Requesters)
                .Include(x => x.Requesteds)
                .Where(
                    user =>
                        (
                            user.Name != null && user.Name.ToLower().Contains(keyLower) ||
                            user.UserName!.ToLower().Contains(keyLower)
                        ) &&
                        !user.IsRemoved &&
                        !user.Blockeds.Any(x => x.BlockedId == accountId) &&
                        user.Id.CompareTo(lastId) > 0
                )
                .OrderBy(x => x.Id)
                .Take(20)
                .ToListAsync(cancellationToken);
        }

        public async Task<List<AppUser>> GetFollowedsByIdAsync(string id, CancellationToken cancellationToken, string lastId = "")
        {
            return await _context
                .AppUsers
                .AsNoTracking()
                .Include(x => x.Posts)
                .Include(x => x.Followers)
                .Include(x => x.Followeds)
                .Include(x => x.Requesters)
                .Include(x => x.Requesteds)
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
                .Include(x => x.Requesters)
                .Include(x => x.Requesteds)
                .FirstOrDefaultAsync(
                    x => x.Id == id && !x.IsRemoved && !x.Blockeds.Any(x => x.BlockedId == accountId), 
                    cancellationToken
                );
        }

        public async Task<List<AppUser>> GetRequestersByIdAsync(string id, CancellationToken cancellationToken, string lastId = "")
        {
            return await _context
                .AppUsers
                .AsNoTracking()
                .Include(x => x.Posts)
                .Include(x => x.Followers)
                .Include(x => x.Followeds)
                .Include(x => x.Requesters)
                .Include(x => x.Requesteds)
                .Where(
                    user =>
                        user.Requesteds.Any(request => request.RequestedId == id) &&
                        !user.IsRemoved &&
                        user.Id.CompareTo(lastId) > 0
                )
                .OrderBy(x => x.Id)
                .Take(20)
                .ToListAsync(cancellationToken);
        }


        public async Task<List<AppUser>> GetRequestedsByIdAsync(string id, CancellationToken cancellationToken, string lastId = "")
        {
            return await _context
                .AppUsers
                .AsNoTracking()
                .Include(x => x.Posts)
                .Include(x => x.Followers)
                .Include(x => x.Followeds)
                .Include(x => x.Requesters)
                .Include(x => x.Requesteds)
                .Where(
                    user =>
                        user.Requesters.Any(request => request.RequesterId == id) &&
                        !user.IsRemoved &&
                        user.Id.CompareTo(lastId) > 0
                )
                .OrderBy(x => x.Id)
                .Take(20)
                .ToListAsync(cancellationToken);
        }
    }
}
