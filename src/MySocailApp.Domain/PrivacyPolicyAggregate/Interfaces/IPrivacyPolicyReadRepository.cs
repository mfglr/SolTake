using MySocailApp.Domain.PrivacyPolicyAggregate;

namespace MySocailApp.Domain.PrivacyPolicyAggregate.Interfaces
{
    public interface IPrivacyPolicyReadRepository
    {
        Task<PrivacyPolicy> GetLastPolicyAsync(CancellationToken cancellationToken);
    }
}
