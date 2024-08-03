using Microsoft.EntityFrameworkCore;
using MySocailApp.Application.ApplicationServices;
using MySocailApp.Domain.AppUserAggregate.Entities;
using MySocailApp.Domain.AppUserAggregate.Interfaces;
using MySocailApp.Infrastructure.DbContexts;
using MySocailApp.Infrastructure.Extetions;

namespace MySocailApp.Infrastructure.AppUserAggregate
{
    public class AppUserReadRepository(AppDbContext context, IAccessTokenReader accessTokenReader) : IAppUserReadRepository
    {
        private readonly AppDbContext _context = context;
        private readonly IAccessTokenReader _accessTokenReader = accessTokenReader;

        public async Task<List<AppUser>> GetFollowersByIdAsync(int id, int? lastId, CancellationToken cancellationToken)
            => await _context
                .AppUsers
                .AsNoTracking()
                .IncludeForUser()
                .Where(
                    user =>
                        user.Followeds.Any(follow => follow.FollowedId == id) &&
                        !user.IsRemoved &&
                        (lastId == null || user.Id > lastId)
                )
                .OrderByDescending(x => x.Id)
                .Take(20)
                .ToListAsync(cancellationToken);

        public async Task<List<AppUser>> SearchUser(string key, int? lastId, CancellationToken cancellationToken)
        {
            if (key == "") return [];
            var accountId = _accessTokenReader.GetAccountId();
            var keyLower = key.ToLower();
            
            return await _context
                .AppUsers
                .AsNoTracking()
                .IncludeForUser()
                .Where(
                    user =>
                        (
                            user.Name != null && user.Name.ToLower().Contains(keyLower) ||
                            user.Account.UserName!.ToLower().Contains(keyLower)
                        ) &&
                        !user.IsRemoved &&
                        !user.Blockeds.Any(x => x.BlockedId == accountId) &&
                        (lastId == null || user.Id > lastId)
                )
                .OrderByDescending(x => x.Id)
                .Take(20)
                .ToListAsync(cancellationToken);
        }

        public async Task<List<AppUser>> GetFollowedsByIdAsync(int id, int? lastId, CancellationToken cancellationToken)
            => await _context
                .AppUsers
                .AsNoTracking()
                .IncludeForUser()
                .Where(
                    user =>
                        user.Followers.Any(follow => follow.FollowerId == id) &&
                        !user.IsRemoved &&
                        (lastId == null || user.Id > lastId)
                )
                .OrderByDescending(x => x.Id)
                .Take(20)
                .ToListAsync(cancellationToken);

        public async Task<AppUser?> GetByIdAsync(int id, CancellationToken cancellationToken)
            => await _context
                .AppUsers
                .AsNoTracking()
                .IncludeForUser()
                .FirstOrDefaultAsync(
                    x => x.Id == id && !x.IsRemoved && !x.Blockeds.Any(x => x.BlockedId == _accessTokenReader.GetAccountId()), 
                    cancellationToken
                );

        public async Task<List<AppUser>> GetRequestersByIdAsync(int id, int? lastId, CancellationToken cancellationToken)
            => await _context
                .AppUsers
                .AsNoTracking()
                .IncludeForUser()
                .Where(
                    user =>
                        user.Requesteds.Any(request => request.RequestedId == id) &&
                        !user.IsRemoved &&
                        (lastId == null || user.Id > lastId)
                )
                .OrderByDescending(x => x.Id)
                .Take(20)
                .ToListAsync(cancellationToken);

        public async Task<List<AppUser>> GetRequestedsByIdAsync(int id, int? lastId, CancellationToken cancellationToken)
            => await _context
                .AppUsers
                .AsNoTracking()
                .IncludeForUser()
                .Where(
                    user =>
                        user.Requesters.Any(request => request.RequesterId == id) &&
                        !user.IsRemoved &&
                        (lastId == null || user.Id > lastId)
                )
                .OrderByDescending(x => x.Id)
                .Take(20)
                .ToListAsync(cancellationToken);

        public async Task<AppUser?> GetByUserNameAsync(string userName, CancellationToken cancellationToken)
            => await _context
                .AppUsers
                .AsNoTracking()
                .IncludeForUser()
                .FirstOrDefaultAsync(x => x.Account.UserName == userName, cancellationToken);

        public async Task<List<AppUser>> GetByUserNames(IEnumerable<string> userNames, CancellationToken cancellationToken)
            => await _context.AppUsers
                .AsNoTracking()
                .Where(x => userNames.Contains(x.Account.UserName))
                .ToListAsync(cancellationToken);

        public async Task<List<AppUser>> GetConversationsAsync(int userId,int? lastId,int? take,CancellationToken cancellationToken)
            => await _context.AppUsers
                .AsNoTracking()
                .IncludeForUser()
                .Include(x => x.Messages.OrderByDescending(x => x.Id).Take(1))
                .Include(x => x.MessagesReceived.OrderByDescending(x => x.Id).Take(1))
                .Where(
                    x =>
                        x.Messages.Any(x => x.ReceiverId == userId) ||
                        x.MessagesReceived.Any(x => x.SenderId == userId)
                )
                .Select(
                    x => new
                    {
                        User = x,
                        LastMessageReceived = x.Messages.Where(x => x.ReceiverId == userId).OrderBy(x => x.Id).LastOrDefault(),
                        LastMessageSent = x.MessagesReceived.Where(x => x.SenderId == userId).OrderBy(x => x.Id).LastOrDefault()
                    }
                )
                .Select(
                    x => new {
                        x.User,
                        LastMessageId =
                            x.LastMessageReceived == null ?
                                x.LastMessageSent!.Id :
                                x.LastMessageSent == null ?
                                    x.LastMessageReceived!.Id :
                                    x.LastMessageReceived!.Id > x.LastMessageSent!.Id ?
                                        x.LastMessageReceived!.Id :
                                        x.LastMessageSent!.Id
                    }
                )
                .Where(x => lastId == null || x.LastMessageId < lastId)
                .OrderByDescending(x => x.LastMessageId)
                .Take(take ?? 20)
                .Select(x => x.User)
                .ToListAsync(cancellationToken);

        public async Task<List<AppUser>> GetNewMessagesSendersAsync(int receiverId,CancellationToken cancellationToken)
            => await _context.AppUsers
                .AsNoTracking()
                .IncludeForUser()
                .Include(x => x.Messages.Where(x => x.ReceiverId == receiverId && x.Viewers.Count == 0))
                .ThenInclude(x => x.Receivers)
                .Where(x => x.Messages.Any(x => x.ReceiverId == receiverId && x.Viewers.Count == 0))
                .ToListAsync(cancellationToken);
    }
}
