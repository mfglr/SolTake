using MySocailApp.Domain.PrivacyPolicyAggregate;

namespace MySocailApp.Domain.PrivacyPolicyAggregate.Abstracts
{
    public interface IPrivacyPolicyReadRepository
    {
        Task<PrivacyPolicy> GetLastPolicyAsync(CancellationToken cancellationToken);
    }
}
