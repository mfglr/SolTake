using MySocailApp.Application.InfrastructureServices;
using MySocailApp.Core;
using MySocailApp.Domain.MessageDomain.MessageUserViewAggregate.Abstracts;
using MySocailApp.Domain.UserDomain.UserAggregate.DomainEvents;

namespace MySocailApp.Application.DomainEventConsumers.UserDeletedDomainEventConsumers.MessageUserViewAggregate
{
    public class DeleteMessageUserViews(IMessageUserViewWriteRepository messageUserViewWriteRepository, IUnitOfWork unitOfWork) : IDomainEventConsumer<UserDeletedDomainEvent>
    {
        private readonly IMessageUserViewWriteRepository _messageUserViewWriteRepository = messageUserViewWriteRepository;
        private readonly IUnitOfWork _unitOfWork = unitOfWork;

        public async Task Handle(UserDeletedDomainEvent notification, CancellationToken cancellationToken)
        {
            var messageUserViews = await _messageUserViewWriteRepository.GetByUserIdAsync(notification.User.Id,cancellationToken);
            _messageUserViewWriteRepository.DeleteRange(messageUserViews);
            await _unitOfWork.CommitAsync(cancellationToken);
        }
    }
}
