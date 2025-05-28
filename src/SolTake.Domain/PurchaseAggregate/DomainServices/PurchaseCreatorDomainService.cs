using SolTake.Domain.PurchaseAggregate.Abstracts;
using SolTake.Domain.PurchaseAggregate.Entities;
using SolTake.Domain.PurchaseAggregate.Exceptions;

namespace SolTake.Domain.PurchaseAggregate.DomainServices
{
    public class PurchaseCreatorDomainService(IPurchaseRepository purchaseRepository)
    {
        private readonly IPurchaseRepository _purchaseRepository = purchaseRepository;

        public async Task CreateAsync(Purchase purchase, CancellationToken cancellationToken)
        {
            if (await _purchaseRepository.ExistAsync(purchase.Token, cancellationToken))
                throw new PurchaseTokenAlreadyUsed();

            purchase.Create();
        }
    }
}
