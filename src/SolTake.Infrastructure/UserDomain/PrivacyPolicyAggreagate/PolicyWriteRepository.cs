using SolTake.Domain.PrivacyPolicyAggregate;
using SolTake.Domain.PrivacyPolicyAggregate.Abstracts;
using SolTake.Infrastructure.DbContexts;

namespace SolTake.Infrastructure.UserDomain.PrivacyPolicyAggreagate
{
    internal class PolicyWriteRepository(AppDbContext context) : IPrivacyPolicyWriteRepository
    {
        private readonly AppDbContext _context = context;

        public async Task CreateAsync(PrivacyPolicy policy, CancellationToken cancellationToken)
            => await _context.PrivacyPolicies.AddAsync(policy, cancellationToken);
    }
}
