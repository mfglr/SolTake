using SolTake.Application.InfrastructureServices;
using SolTake.Domain.MessageUserViewAggregate.Abstracts;
using SolTake.Domain.UserAggregate.DomainEvents;
using SolTake.Core;

namespace SolTake.Application.DomainEventConsumers.UserDeletedDomainEventConsumers.MessageUserViewAggregate
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
