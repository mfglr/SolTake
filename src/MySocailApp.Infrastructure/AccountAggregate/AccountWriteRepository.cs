using AccountDomain.AccountAggregate.Abstracts;
using AccountDomain.AccountAggregate.Entities;
using AccountDomain.AccountAggregate.ValueObjects;
using Microsoft.EntityFrameworkCore;
using MySocailApp.Infrastructure.DbContexts;

namespace MySocailApp.Infrastructure.AccountAggregate
{
    public class AccountWriteRepository(AppDbContext appDbContext) : IAccountWriteRepository
    {
        private readonly AppDbContext _context = appDbContext;
     
        public Task<Account?> GetAccountAsync(int accountId, CancellationToken cancellationToken)
            => _context.Accounts
                .Include(x => x.PrivacyPolicies)
                .Include(x => x.TermsOfUses)
                .Include(x => x.Roles)
                .Include(x => x.Blockers)
                .Include(x => x.VerificationTokens)
                .Include(x => x.PasswordResestTokens)
                .FirstOrDefaultAsync(x => x.Id == accountId, cancellationToken);

        public Task<Account?> GetAccountByEmailAsync(Email email, CancellationToken cancellationToken)
            => _context.Accounts
                .Include(x => x.PrivacyPolicies)
                .Include(x => x.TermsOfUses)
                .Include(x => x.Roles)
                .Include(x => x.Blockers)
                .Include(x => x.VerificationTokens)
                .Include(x => x.PasswordResestTokens)
                .FirstOrDefaultAsync(x => x.Email.Value == email.Value, cancellationToken);

        public Task<Account?> GetAccountByUserNameAsync(UserName userName, CancellationToken cancellationToken)
            => _context.Accounts
                .Include(x => x.PrivacyPolicies)
                .Include(x => x.TermsOfUses)
                .Include(x => x.Roles)
                .Include(x => x.Blockers)
                .Include(x => x.VerificationTokens)
                .Include(x => x.PasswordResestTokens)
                .FirstOrDefaultAsync(x => x.UserName.Value == userName.Value, cancellationToken);

        public Task<Account?> GetAccountByGoogleAccount(GoogleAccount googleAccount, CancellationToken cancellationToken)
            => _context.Accounts
                .Include(x => x.PrivacyPolicies)
                .Include(x => x.TermsOfUses)
                .Include(x => x.Roles)
                .Include(x => x.Blockers)
                .Include(x => x.VerificationTokens)
                .Include(x => x.PasswordResestTokens)
                .FirstOrDefaultAsync(x => x.GoogleAccount.UserId == googleAccount.UserId, cancellationToken);

        public void Delete(Account account) => _context.Accounts.Remove(account);

        public async Task CreateAsync(Account account, CancellationToken cancellationToken)
            => await _context.Accounts.AddAsync(account, cancellationToken);
    }
}
