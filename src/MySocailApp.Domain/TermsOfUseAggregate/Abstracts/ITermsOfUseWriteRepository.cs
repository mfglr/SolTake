namespace MySocailApp.Domain.TermsOfUseAggregate.Abstracts
{
    public interface ITermsOfUseWriteRepository
    {
        Task CreateAsync(TermsOfUse termsOfUse,CancellationToken cancellationToken);
    }
}
