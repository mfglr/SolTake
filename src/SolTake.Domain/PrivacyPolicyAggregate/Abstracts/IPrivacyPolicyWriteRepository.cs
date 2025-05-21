using SolTake.Domain.PrivacyPolicyAggregate;

namespace SolTake.Domain.PrivacyPolicyAggregate.Abstracts
{
    public interface IPrivacyPolicyWriteRepository
    {
        Task CreateAsync(PrivacyPolicy policy, CancellationToken cancellationToken);
    }
}
