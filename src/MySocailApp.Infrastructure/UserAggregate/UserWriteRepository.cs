using Microsoft.EntityFrameworkCore;
using MySocailApp.Domain.UserDomain.UserAggregate.Abstracts;
using MySocailApp.Domain.UserDomain.UserAggregate.Entities;
using MySocailApp.Domain.UserDomain.UserAggregate.ValueObjects;
using MySocailApp.Infrastructure.DbContexts;

namespace MySocailApp.Infrastructure.UserAggregate
{
    public class UserWriteRepository(AppDbContext context) : IUserWriteRepository
    {
        private readonly AppDbContext _context = context;

        public async Task CreateAsync(User user, CancellationToken cancellationToken)
            => await _context.Users.AddAsync(user, cancellationToken);

        public void Delete(User user) => _context.Users.Remove(user);

        public Task<User?> GetByIdAsync(int accountId, CancellationToken cancellationToken)
            => _context.Users
                .Include(x => x.PrivacyPolicies)
                .Include(x => x.TermsOfUses)
                .Include(x => x.Roles)
                .Include(x => x.Blockers)
                .Include(x => x.VerificationTokens)
                .Include(x => x.PasswordResestTokens)
                .FirstOrDefaultAsync(x => x.Id == accountId, cancellationToken);

        public Task<User?> GetByEmailAsync(Email email, CancellationToken cancellationToken)
            => _context.Users
                .Include(x => x.PrivacyPolicies)
                .Include(x => x.TermsOfUses)
                .Include(x => x.Roles)
                .Include(x => x.Blockers)
                .Include(x => x.VerificationTokens)
                .Include(x => x.PasswordResestTokens)
                .FirstOrDefaultAsync(x => x.Email.Value == email.Value, cancellationToken);

        public Task<User?> GetByUserNameAsync(UserName userName, CancellationToken cancellationToken)
            => _context.Users
                .Include(x => x.PrivacyPolicies)
                .Include(x => x.TermsOfUses)
                .Include(x => x.Roles)
                .Include(x => x.Blockers)
                .Include(x => x.VerificationTokens)
                .Include(x => x.PasswordResestTokens)
                .FirstOrDefaultAsync(x => x.UserName.Value == userName.Value, cancellationToken);

        public Task<User?> GetByGoogleAccount(GoogleAccount googleAccount, CancellationToken cancellationToken)
            => _context.Users
                .Include(x => x.PrivacyPolicies)
                .Include(x => x.TermsOfUses)
                .Include(x => x.Roles)
                .Include(x => x.Blockers)
                .Include(x => x.VerificationTokens)
                .Include(x => x.PasswordResestTokens)
                .FirstOrDefaultAsync(x => x.GoogleAccount.GoogleId == googleAccount.GoogleId, cancellationToken);

        public Task<User?> GetWithFollowerByIdAsync(int id, int followerId, CancellationToken cancellationToken)
            => _context.Users
                .Include(x => x.Followers.Where(x => x.FollowerId == followerId))
                .Include(x => x.UserFollowNotifications.Where(x => x.FollowerId == followerId))
                .FirstOrDefaultAsync(x => x.Id == id, cancellationToken);

        public Task<User?> GetWithSearcherByIdAsync(int id, int searcherId, CancellationToken cancellationToken)
            => _context.Users
                .Include(x => x.Searchers.Where(x => x.SearcherId == searcherId))
                .FirstOrDefaultAsync(x => x.Id == id, cancellationToken);

        public async Task DeleteFollowsByUserId(int userId, CancellationToken cancellationToken)
        {
            var follows = await _context.Follows.Where(x => x.FollowerId == userId).ToListAsync(cancellationToken);
            _context.Follows.RemoveRange(follows);
        }

        public async Task DeleteFollowNotificationsByUserId(int userId, CancellationToken cancellationToken)
        {
            var notifications = await _context.UserFollowNotifications.Where(x => x.FollowerId == userId).ToListAsync(cancellationToken);
            _context.UserFollowNotifications.RemoveRange(notifications);
        }

        public async Task DeleteUserSerchsByUserId(int userId, CancellationToken cancellationToken)
        {
            var searchs = await _context.UserSearchs.Where(x => x.SearcherId == userId).ToListAsync(cancellationToken);
            _context.UserSearchs.RemoveRange(searchs);
        }

        
    }
}
