using MediatR;
using MySocailApp.Application.ApplicationServices;
using MySocailApp.Core;
using MySocailApp.Domain.AccountAggregate.DomainEvents;
using MySocailApp.Domain.AppUserAggregate.Abstracts;
using MySocailApp.Domain.AppUserAggregate.DomainEvents;

namespace MySocailApp.Application.DomainEventConsumers.AccountDeletedDomainEventConsumers.UserAggregate
{
    public class DeleteUser(IAppUserWriteRepository userWriteRepository, IUnitOfWork unitOfWork, IPublisher publisher) : IDomainEventConsumer<AccountDeletedDomainEvent>
    {
        private readonly IAppUserWriteRepository _userWriteRepository = userWriteRepository;
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
