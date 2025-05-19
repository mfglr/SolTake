using MySocailApp.Application.InfrastructureServices;
using MySocailApp.Domain.MessageUserViewAggregate.Abstracts;
using MySocailApp.Domain.UserAggregate.DomainEvents;
using SolTake.Core;

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
