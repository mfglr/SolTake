using Microsoft.EntityFrameworkCore;
using SolTake.Domain.PrivacyPolicyAggregate;
using SolTake.Domain.PrivacyPolicyAggregate.Abstracts;
using SolTake.Infrastructure.DbContexts;

namespace SolTake.Infrastructure.UserDomain.PrivacyPolicyAggreagate
{
    internal class PolicyReadRepository(AppDbContext context) : IPrivacyPolicyReadRepository
    {
        private readonly AppDbContext _context = context;

        public Task<PrivacyPolicy> GetLastPolicyAsync(CancellationToken cancellationToken)
            => _context.PrivacyPolicies
                .AsNoTracking()
                .OrderByDescending(x => x.Id)
                .FirstAsync(cancellationToken);
    }
}
