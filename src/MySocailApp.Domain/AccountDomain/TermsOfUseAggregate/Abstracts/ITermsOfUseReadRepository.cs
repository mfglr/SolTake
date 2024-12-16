using MySocailApp.Domain.AccountDomain.TermsOfUseAggregate;

namespace MySocailApp.Domain.AccountDomain.TermsOfUseAggregate.Abstracts
{
    public interface ITermsOfUseReadRepository
    {
        Task<TermsOfUse> GetLastTermsOfUseAsync(CancellationToken cancellationToken);
    }
}
