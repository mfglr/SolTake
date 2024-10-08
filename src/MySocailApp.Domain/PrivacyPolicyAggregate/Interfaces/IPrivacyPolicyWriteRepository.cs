using MySocailApp.Domain.PrivacyPolicyAggregate;

namespace MySocailApp.Domain.PrivacyPolicyAggregate.Interfaces
{
    public interface IPrivacyPolicyWriteRepository
    {
        Task CreateAsync(PrivacyPolicy policy, CancellationToken cancellationToken);
    }
}
