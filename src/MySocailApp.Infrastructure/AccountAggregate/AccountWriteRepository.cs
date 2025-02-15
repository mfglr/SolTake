using AccountDomain.AccountAggregate.Abstracts;
using AccountDomain.AccountAggregate.Entities;
using AccountDomain.AccountAggregate.ValueObjects;
using Microsoft.EntityFrameworkCore;
using MySocailApp.Domain.UserAggregate.Entities;
using MySocailApp.Infrastructure.DbContexts;

namespace MySocailApp.Infrastructure.AccountAggregate
{
    public class AccountWriteRepository(AppDbContext appDbContext) : IAccountWriteRepository
    {
        private readonly AppDbContext _context = appDbContext;
     
        public async Task<Account?> GetAccountAsync(int accountId, CancellationToken cancellationToken)
            => await _context.Users
                .Include(x => x.PrivacyPolicies)
                .Include(x => x.TermsOfUses)
                .Include(x => x.Roles)
                .Include(x => x.Blockers)
                .Include(x => x.VerificationTokens)
                .Include(x => x.PasswordResestTokens)
                .FirstOrDefaultAsync(x => x.Id == accountId, cancellationToken);

        public async Task<Account?> GetAccountByEmailAsync(Email email, CancellationToken cancellationToken)
            => await _context.Users
                .Include(x => x.PrivacyPolicies)
                .Include(x => x.TermsOfUses)
                .Include(x => x.Roles)
                .Include(x => x.Blockers)
                .Include(x => x.VerificationTokens)
                .Include(x => x.PasswordResestTokens)
                .FirstOrDefaultAsync(x => x.Email.Value == email.Value, cancellationToken);

        public async Task<Account?> GetAccountByUserNameAsync(UserName userName, CancellationToken cancellationToken)
            => await _context.Users
                .Include(x => x.PrivacyPolicies)
                .Include(x => x.TermsOfUses)
                .Include(x => x.Roles)
                .Include(x => x.Blockers)
                .Include(x => x.VerificationTokens)
                .Include(x => x.PasswordResestTokens)
                .FirstOrDefaultAsync(x => x.UserName.Value == userName.Value, cancellationToken);

        public async Task<Account?> GetAccountByGoogleAccount(GoogleAccount googleAccount, CancellationToken cancellationToken)
            => await _context.Users
                .Include(x => x.PrivacyPolicies)
                .Include(x => x.TermsOfUses)
                .Include(x => x.Roles)
                .Include(x => x.Blockers)
                .Include(x => x.VerificationTokens)
                .Include(x => x.PasswordResestTokens)
                .FirstOrDefaultAsync(x => x.GoogleAccount.UserId == googleAccount.UserId, cancellationToken);

        public void Delete(User account) => _context.Users.Remove(account);

        public async Task CreateAsync(User account, CancellationToken cancellationToken)
            => await _context.Users.AddAsync(account, cancellationToken);
    }
}
