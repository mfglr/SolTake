namespace AccountDomain.PrivacyPolicyAggregate.Abstracts
{
    public interface IPrivacyPolicyWriteRepository
    {
        Task CreateAsync(PrivacyPolicy policy, CancellationToken cancellationToken);
    }
}
