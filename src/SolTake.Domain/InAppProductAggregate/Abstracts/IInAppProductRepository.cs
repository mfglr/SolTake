using SolTake.Domain.InAppProductAggregate.Entities;

namespace SolTake.Domain.InAppProductAggregate.Abstracts
{
    public interface IInAppProductRepository
    {
        Task<InAppProduct?> GetByProductIdAsync(string productId, CancellationToken cancellationToken);
    }
}
