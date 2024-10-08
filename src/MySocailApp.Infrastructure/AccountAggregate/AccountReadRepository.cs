using Microsoft.EntityFrameworkCore;
using MySocailApp.Domain.AccountAggregate.Abstracts;
using MySocailApp.Domain.AccountAggregate.Entities;
using MySocailApp.Infrastructure.DbContexts;

namespace MySocailApp.Infrastructure.AccountAggregate
{
    public class AccountReadRepository(AppDbContext context) : IAccountReadRepository
    {
        private readonly AppDbContext _context = context;

        public Task<Account?> GetAccountAsync(int accountId, CancellationToken cancellationToken)
            => _context.Users
                .AsNoTracking()
                .Include(x => x.PrivacyPolicies)
                .Include(x => x.TermsOfUses)
                .Include(x => x.VerificationTokens)
                .FirstOrDefaultAsync(x => x.Id == accountId && !x.IsRemoved,cancellationToken);
    }
}
