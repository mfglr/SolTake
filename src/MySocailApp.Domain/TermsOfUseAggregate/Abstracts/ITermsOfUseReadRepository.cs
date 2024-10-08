namespace MySocailApp.Domain.TermsOfUseAggregate.Abstracts
{
    public interface ITermsOfUseReadRepository
    {
        Task<TermsOfUse> GetLastTermsOfUseAsync(CancellationToken cancellationToken);
    }
}
