using SolTake.Domain.TermsOfUseAggregate;

namespace SolTake.Domain.TermsOfUseAggregate.Abstracts
{
    public interface ITermsOfUseReadRepository
    {
        Task<TermsOfUse> GetLastTermsOfUseAsync(CancellationToken cancellationToken);
    }
}
