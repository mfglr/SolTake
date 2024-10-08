using Microsoft.EntityFrameworkCore;
using MySocailApp.Domain.AccountAggregate.Abstracts;
using MySocailApp.Domain.AccountAggregate.Entities;
using MySocailApp.Infrastructure.DbContexts;

namespace MySocailApp.Infrastructure.AccountAggregate
{
    public class AccountWriteRepository(AppDbContext appDbContext) : IAccountWriteRepository
    {
        private readonly AppDbContext _context = appDbContext;
     
        public Task<Account?> GetAccountAsync(int accountId, CancellationToken cancellationToken)
            => _context.Users
                .Include(x => x.PrivacyPolicies)
                .Include(x => x.TermsOfUses)
                .Include(x => x.VerificationTokens)
                .FirstOrDefaultAsync(x => x.Id == accountId && !x.IsRemoved, cancellationToken);

        public Task<Account?> GetAccountByEmailAsync(string email, CancellationToken cancellationToken)
            => _context.Users
                .Include(x => x.PrivacyPolicies)
                .Include(x => x.TermsOfUses)
                .Include(x => x.VerificationTokens)
                .FirstOrDefaultAsync(x => x.Email == email && !x.IsRemoved, cancellationToken);

        public Task<Account?> GetAccountByUserNameAsync(string userName, CancellationToken cancellationToken)
            => _context.Users
                .Include(x => x.PrivacyPolicies)
                .Include(x => x.TermsOfUses)
                .Include(x => x.VerificationTokens)
                .FirstOrDefaultAsync(x => x.UserName == userName && !x.IsRemoved, cancellationToken);
    }
}
