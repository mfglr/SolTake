using MySocailApp.Application.InfrastructureServices;
using MySocailApp.Core;
using MySocailApp.Domain.BalanceAggregate.Abstracts;
using MySocailApp.Domain.BalanceAggregate.ValueObjects;
using MySocailApp.Domain.BalanceAggregate.Entities;
using MySocailApp.Domain.UserAggregate.DomainEvents;

namespace MySocailApp.Application.DomainEventConsumers.UserCreatedDomainEventConsumers.BalanceAggregate
{
    public class CreateBalance(IBalanceRepository balanceRepository, IUnitOfWork unitOfWork) : IDomainEventConsumer<UserCreatedDomainEvent>
    {
        private readonly IBalanceRepository _balanceRepository = balanceRepository;
        private readonly IUnitOfWork _unitOfWork = unitOfWork;

        public async Task Handle(UserCreatedDomainEvent notification, CancellationToken cancellationToken)
        {
            var balance = new Balance(notification.User.Id, Money.Dollar(0.001m));
            balance.Create();
            await _balanceRepository.CreateAsync(balance, cancellationToken);
            await _unitOfWork.CommitAsync(cancellationToken);
        }
    }
}
