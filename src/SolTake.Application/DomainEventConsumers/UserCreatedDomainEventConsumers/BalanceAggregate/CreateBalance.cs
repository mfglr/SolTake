using MySocailApp.Application.InfrastructureServices;
using SolTake.Domain.BalanceAggregate.Entities;
using SolTake.Domain.UserAggregate.DomainEvents;
using SolTake.Core;
using SolTake.Domain.BalanceAggregate.Abstracts;

namespace MySocailApp.Application.DomainEventConsumers.UserCreatedDomainEventConsumers.BalanceAggregate
{
    public class CreateBalance(IBalanceRepository balanceRepository, IUnitOfWork unitOfWork) : IDomainEventConsumer<UserCreatedDomainEvent>
    {
        private readonly IBalanceRepository _balanceRepository = balanceRepository;
        private readonly IUnitOfWork _unitOfWork = unitOfWork;

        public async Task Handle(UserCreatedDomainEvent notification, CancellationToken cancellationToken)
        {
            var balance = new Balance(notification.User.Id);
            balance.Create();
            await _balanceRepository.CreateAsync(balance, cancellationToken);
            await _unitOfWork.CommitAsync(cancellationToken);
        }
    }
}
