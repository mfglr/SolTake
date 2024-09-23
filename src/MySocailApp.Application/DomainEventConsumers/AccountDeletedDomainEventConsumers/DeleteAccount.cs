using MySocailApp.Application.ApplicationServices;
using MySocailApp.Core;
using MySocailApp.Domain.AccountAggregate.DomainEvents;
using MySocailApp.Domain.AccountAggregate.DomainServices;

namespace MySocailApp.Application.DomainEventConsumers.AccountDeletedDomainEventConsumers
{
    public class DeleteAccount(IUnitOfWork unitOfWork, AccountDeleterDomainService accountDeleter) : IDomainEventConsumer<AccountDeletedDomainEvent>
    {
        private readonly IUnitOfWork _unitOfWork = unitOfWork;
        private readonly AccountDeleterDomainService _accountDeleter = accountDeleter;

        public async Task Handle(AccountDeletedDomainEvent notification, CancellationToken cancellationToken)
        {
            await _accountDeleter.DeleteAsync(notification.Account.Id, cancellationToken);
            await _unitOfWork.CommitAsync(cancellationToken);
        }
    }
}
