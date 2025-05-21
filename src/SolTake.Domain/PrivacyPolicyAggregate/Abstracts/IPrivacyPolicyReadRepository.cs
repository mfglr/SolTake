using SolTake.Domain.PrivacyPolicyAggregate;

namespace SolTake.Domain.PrivacyPolicyAggregate.Abstracts
{
    public interface IPrivacyPolicyReadRepository
    {
        Task<PrivacyPolicy> GetLastPolicyAsync(CancellationToken cancellationToken);
    }
}
