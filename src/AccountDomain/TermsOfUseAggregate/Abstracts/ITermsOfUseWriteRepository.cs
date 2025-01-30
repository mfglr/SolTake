namespace AccountDomain.TermsOfUseAggregate.Abstracts
{
    public interface ITermsOfUseWriteRepository
    {
        Task CreateAsync(TermsOfUse termsOfUse, CancellationToken cancellationToken);
    }
}
