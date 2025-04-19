using MySocailApp.Domain.PrivacyPolicyAggregate;

namespace MySocailApp.Domain.PrivacyPolicyAggregate.Abstracts
{
    public interface IPrivacyPolicyWriteRepository
    {
        Task CreateAsync(PrivacyPolicy policy, CancellationToken cancellationToken);
    }
}
