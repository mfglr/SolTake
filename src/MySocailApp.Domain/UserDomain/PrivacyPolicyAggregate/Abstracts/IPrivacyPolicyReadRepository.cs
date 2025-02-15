namespace MySocailApp.Domain.UserDomain.PrivacyPolicyAggregate.Abstracts
{
    public interface IPrivacyPolicyReadRepository
    {
        Task<PrivacyPolicy> GetLastPolicyAsync(CancellationToken cancellationToken);
    }
}
