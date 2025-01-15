using AccountDomain.DomainEvents;
using MediatR;
using MySocailApp.Application.InfrastructureServices;
using MySocailApp.Core;
using MySocailApp.Domain.UserAggregate.Abstracts;
using MySocailApp.Domain.UserAggregate.DomainEvents;

namespace MySocailApp.Application.DomainEventConsumers.AccountDeletedDomainEventConsumers.UserAggregate
{
    public class DeleteUser(IUserWriteRepository userWriteRepository, IUnitOfWork unitOfWork, IPublisher publisher) : IDomainEventConsumer<AccountDeletedDomainEvent>
    {
        private readonly IUserWriteRepository _userWriteRepository = userWriteRepository;
        private readonly IUnitOfWork _unitOfWork = unitOfWork;
        private readonly IPublisher _publisher = publisher;

        public async Task Handle(AccountDeletedDomainEvent notification, CancellationToken cancellationToken)
        {
            var user = await _userWriteRepository.GetByIdAsync(notification.Account.Id, cancellationToken);
            _userWriteRepository.Delete(user);
            await _unitOfWork.CommitAsync(cancellationToken);

            await _publisher.Publish(new UserDeletedDomainEvent(user));
        }
    }
}
