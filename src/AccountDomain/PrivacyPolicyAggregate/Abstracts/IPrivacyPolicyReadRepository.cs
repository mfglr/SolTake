namespace AccountDomain.PrivacyPolicyAggregate.Abstracts
{
    public interface IPrivacyPolicyReadRepository
    {
        Task<PrivacyPolicy> GetLastPolicyAsync(CancellationToken cancellationToken);
    }
}
