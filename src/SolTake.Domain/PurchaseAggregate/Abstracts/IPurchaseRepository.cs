using SolTake.Domain.PurchaseAggregate.Entities;

namespace SolTake.Domain.PurchaseAggregate.Abstracts
{
    public interface IPurchaseRepository
    {
        Task CreateAsync(Purchase purchase,CancellationToken cancellationToken);
        Task<bool> ExistAsync(string token, CancellationToken cancellationToken);
    }
}
