using MediatR;
using SolTake.Application.InfrastructureServices;
using SolTake.Core;
using SolTake.Domain.InAppProductAggregate.Abstracts;
using SolTake.Domain.PurchaseAggregate.Abstracts;
using SolTake.Domain.PurchaseAggregate.DomainEvents;
using SolTake.Domain.TransactionAggregate.Abstracts;
using SolTake.Domain.TransactionAggregate.DomainEvents;
using SolTake.Domain.TransactionAggregate.Entities;

namespace SolTake.Application.DomainEventConsumers.PurchaseCreatedDomainEventConsumers.TransactionAggregate
{
    public class CreateTransaction(ITransactionRepository transactionRepository, IAccessTokenReader accessTokenReader, IInAppProductRepository inAppProductRepository, IPublisher publisher) : IDomainEventConsumer<PurchageCreatedDomainEvent>
    {
        private readonly ITransactionRepository _transactionRepository = transactionRepository;
        private readonly IAccessTokenReader _accessTokenReader = accessTokenReader;
        private readonly IInAppProductRepository _inAppProductRepository = inAppProductRepository;
        private readonly IPublisher _publisher = publisher;

        public async Task Handle(PurchageCreatedDomainEvent notification, CancellationToken cancellationToken)
        {
            var product = await _inAppProductRepository.GetByProductIdAsync(notification.Purchase.ProductId, cancellationToken);
            if (product == null) return;

            var balanceId = _accessTokenReader.GetRequiredAccountId();
            var transaction = new Transaction(balanceId, product.NumberOfSol);
            transaction.Create();
            await _transactionRepository.CreateAsync(transaction, cancellationToken);
            
            await _publisher.Publish(new TransactionCreatedDomainEvent(transaction),cancellationToken);

        }
    }
}
