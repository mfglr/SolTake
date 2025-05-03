using MySocailApp.Application.InfrastructureServices;
using MySocailApp.Core;
using MySocailApp.Domain.BalanceAggregate.Abstracts;
using MySocailApp.Domain.BalanceAggregate.ValueObjects;
using MySocailApp.Domain.TransactionAggregate.DomainEvents;

namespace MySocailApp.Application.DomainEventConsumers.TransactionCreatedDomainEventConsumers.BalanceAggregate
{
    public class CreateBalance(IBalanceRepository balanceRepository, IUnitOfWork unitOfWork) : IDomainEventConsumer<TransactionCreatedDomainEvent>
    {
        private readonly IBalanceRepository _balanceRepository = balanceRepository;
        private readonly IUnitOfWork _unitOfWork = unitOfWork;

        public async Task Handle(TransactionCreatedDomainEvent notification, CancellationToken cancellationToken)
        {
            var balance = await _balanceRepository.GetAsync(notification.Transaction.BalanceId,cancellationToken);
            if (balance == null)
            {
                balance = new(notification.Transaction.BalanceId, new Money(notification.Transaction.Money));
                await _balanceRepository.CreateAsync(balance, cancellationToken);
            }
            else
            {
                balance.Apply(notification.Transaction.Money);
            }
            await _unitOfWork.CommitAsync(cancellationToken);
        }
    }
}
