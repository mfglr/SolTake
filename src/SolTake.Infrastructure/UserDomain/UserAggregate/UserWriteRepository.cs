using Microsoft.EntityFrameworkCore;
using SolTake.Domain.UserAggregate.Abstracts;
using SolTake.Domain.UserAggregate.Entities;
using SolTake.Domain.UserAggregate.ValueObjects;
using SolTake.Infrastructure.DbContexts;

namespace SolTake.Infrastructure.UserDomain.UserAggregate
{
    internal class UserWriteRepository(AppDbContext context) : IUserWriteRepository
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
                .Include(x => x.VerificationTokens)
                .Include(x => x.PasswordResestTokens)
                .FirstOrDefaultAsync(x => x.Id == accountId, cancellationToken);

        public Task<User?> GetByEmailAsync(Email email, CancellationToken cancellationToken)
            => _context.Users
                .Include(x => x.PrivacyPolicies)
                .Include(x => x.TermsOfUses)
                .Include(x => x.Roles)
                .Include(x => x.VerificationTokens)
                .Include(x => x.PasswordResestTokens)
                .FirstOrDefaultAsync(x => x.Email.Value == email.Value, cancellationToken);

        public Task<User?> GetByUserNameAsync(UserName userName, CancellationToken cancellationToken)
            => _context.Users
                .Include(x => x.PrivacyPolicies)
                .Include(x => x.TermsOfUses)
                .Include(x => x.Roles)
                .Include(x => x.VerificationTokens)
                .Include(x => x.PasswordResestTokens)
                .FirstOrDefaultAsync(x => x.UserName.Value == userName.Value, cancellationToken);

        public Task<User?> GetByGoogleAccount(GoogleAccount googleAccount, CancellationToken cancellationToken)
            => _context.Users
                .Include(x => x.PrivacyPolicies)
                .Include(x => x.TermsOfUses)
                .Include(x => x.Roles)
                .Include(x => x.VerificationTokens)
                .Include(x => x.PasswordResestTokens)
                .FirstOrDefaultAsync(x => x.GoogleAccount.GoogleId == googleAccount.GoogleId, cancellationToken);
    }
}
