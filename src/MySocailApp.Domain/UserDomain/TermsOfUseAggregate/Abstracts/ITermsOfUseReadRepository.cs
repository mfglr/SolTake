namespace MySocailApp.Domain.UserDomain.TermsOfUseAggregate.Abstracts
{
    public interface ITermsOfUseReadRepository
    {
        Task<TermsOfUse> GetLastTermsOfUseAsync(CancellationToken cancellationToken);
    }
}
