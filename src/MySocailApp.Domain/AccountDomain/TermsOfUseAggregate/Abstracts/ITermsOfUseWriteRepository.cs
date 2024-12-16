using MySocailApp.Domain.AccountDomain.TermsOfUseAggregate;

namespace MySocailApp.Domain.AccountDomain.TermsOfUseAggregate.Abstracts
{
    public interface ITermsOfUseWriteRepository
    {
        Task CreateAsync(TermsOfUse termsOfUse, CancellationToken cancellationToken);
    }
}
