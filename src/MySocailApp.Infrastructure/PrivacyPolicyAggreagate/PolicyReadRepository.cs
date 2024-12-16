using Microsoft.EntityFrameworkCore;
using MySocailApp.Core;
using MySocailApp.Domain.AccountDomain.PrivacyPolicyAggregate;
using MySocailApp.Domain.AccountDomain.PrivacyPolicyAggregate.Abstracts;
using MySocailApp.Infrastructure.DbContexts;

namespace MySocailApp.Infrastructure.PrivacyPolicyAggreagate
{
    public class PolicyReadRepository(AppDbContext context) : IPrivacyPolicyReadRepository
    {
        private readonly AppDbContext _context = context;

        public Task<PrivacyPolicy> GetLastPolicyAsync(CancellationToken cancellationToken)
            => _context.PrivacyPolicies
                .AsNoTracking()
                .OrderByDescending(x => x.Id)
                .FirstAsync(cancellationToken);
    }
}
