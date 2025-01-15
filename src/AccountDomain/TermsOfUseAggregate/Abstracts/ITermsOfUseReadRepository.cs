using AccountDomain.TermsOfUseAggregate;

namespace AccountDomain.TermsOfUseAggregate.Abstracts
{
    public interface ITermsOfUseReadRepository
    {
        Task<TermsOfUse> GetLastTermsOfUseAsync(CancellationToken cancellationToken);
    }
}
