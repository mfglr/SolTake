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
                .FirstOrDefaultAsync(x => x.Id == accountId,cancellationToken);

        public Task<List<int>> GetAccountIdsByUserNames(IEnumerable<string> userNames, CancellationToken cancellationToken)
            => _context.Users
                .AsNoTracking()
                .Where(x => userNames.Select(x => x.ToLower()).Contains(x.UserName))
                .Select(x => x.Id)
                .ToListAsync(cancellationToken);

        public Task<bool> IsEmailVerified(int accountId, CancellationToken cancellationToken)
            => _context.Users
                .AnyAsync(
                    x => 
                        x.Id == accountId &&
                        (
                            x.IsThirdPartyAuthenticated ||
                            x.VerificationTokens.OrderByDescending(x => x.Id).First().IsVerified
                        ),
                    cancellationToken
                );
    }
}
