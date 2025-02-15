namespace MySocailApp.Domain.UserDomain.PrivacyPolicyAggregate.Abstracts
{
    public interface IPrivacyPolicyWriteRepository
    {
        Task CreateAsync(PrivacyPolicy policy, CancellationToken cancellationToken);
    }
}
