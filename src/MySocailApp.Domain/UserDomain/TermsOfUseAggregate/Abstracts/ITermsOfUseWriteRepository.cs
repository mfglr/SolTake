namespace MySocailApp.Domain.UserDomain.TermsOfUseAggregate.Abstracts
{
    public interface ITermsOfUseWriteRepository
    {
        Task CreateAsync(TermsOfUse termsOfUse, CancellationToken cancellationToken);
    }
}
