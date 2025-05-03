using MediatR;
using MySocailApp.Application.InfrastructureServices;
using MySocailApp.Core;
using MySocailApp.Domain.BalanceAggregate.ValueObjects;
using MySocailApp.Domain.SolutionAggregate.DomainEvents;
using MySocailApp.Domain.TransactionAggregate.Abstracts;
using MySocailApp.Domain.TransactionAggregate.DomainEvents;
using MySocailApp.Domain.TransactionAggregate.Entities;

namespace MySocailApp.Application.DomainEventConsumers.SolutionCreatedDomainEventConsumers.TransactionAggregate
{
    public class CreateTransaction(ITransactionRepository transactionRepository, IUnitOfWork unitOfWork, IPublisher publisher) : IDomainEventConsumer<SolutionCreatedDomainEvent>
    {
        private readonly ITransactionRepository _transactionRepository = transactionRepository;
        private readonly IUnitOfWork _unitOfWork = unitOfWork;
        private readonly IPublisher _publisher = publisher;

        public async Task Handle(SolutionCreatedDomainEvent notification, CancellationToken cancellationToken)
        {
            if (!notification.Solution.IsCreatedByAI) return;

            var money = Money.Dollar(notification.Solution.Cost);
            var transaction = new Transaction(notification.Solution.UserId, money);
            transaction.Create();
            await _transactionRepository.CreateAsync(transaction, cancellationToken);
            await _unitOfWork.CommitAsync(cancellationToken);
            await _publisher.Publish(new TransactionCreatedDomainEvent(transaction), cancellationToken);
        }
    }
}
