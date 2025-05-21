using SolTake.Domain.TermsOfUseAggregate;

namespace SolTake.Domain.TermsOfUseAggregate.Abstracts
{
    public interface ITermsOfUseWriteRepository
    {
        Task CreateAsync(TermsOfUse termsOfUse, CancellationToken cancellationToken);
    }
}
