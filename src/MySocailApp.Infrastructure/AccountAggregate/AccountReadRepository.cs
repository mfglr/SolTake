using AccountDomain.Abstracts;
using AccountDomain.Entities;
using AccountDomain.ValueObjects;
using Microsoft.EntityFrameworkCore;
using MySocailApp.Infrastructure.DbContexts;

namespace MySocailApp.Infrastructure.AccountAggregate
{
    public class AccountReadRepository(AppDbContext context) : IAccountReadRepository
    {
        private readonly AppDbContext _context = context;

        public Task<bool> EmailExist(Email email, CancellationToken cancellationToken)
            => _context.Accounts.AnyAsync(x => x.Email.Value == email.Value, cancellationToken);

        public Task<bool> Exist(int accountId, CancellationToken cancellationToken)
            => _context.Accounts.AnyAsync(x => x.Id == accountId, cancellationToken);

        public Task<Account?> GetAccountAsync(int accountId, CancellationToken cancellationToken)
            => _context.Accounts
                .AsNoTracking()
                .Include(x => x.PrivacyPolicies)
                .Include(x => x.TermsOfUses)
                .Include(x => x.VerificationTokens)
                .FirstOrDefaultAsync(x => x.Id == accountId,cancellationToken);

        public Task<List<int>> GetAccountIdsByUserNames(IEnumerable<string> userNames, CancellationToken cancellationToken)
            => _context.Accounts
                .AsNoTracking()
                .Where(x => userNames.Select(x => x.ToLower()).Contains(x.UserName.Value))
                .Select(x => x.Id)
                .ToListAsync(cancellationToken);

        public Task<bool> IsEmailVerified(int accountId, CancellationToken cancellationToken)
            => _context.Accounts
                .AnyAsync(
                    x => 
                        x.Id == accountId &&
                        (
                            x.VerificationTokens.OrderByDescending(x => x.Id).First().IsVerified
                        ),
                    cancellationToken
                );

        public Task<bool> UserNameExist(UserName userName, CancellationToken cancellationToken)
            => _context.Accounts.AnyAsync(x => x.UserName.Value == userName.Value, cancellationToken);
    }
}
