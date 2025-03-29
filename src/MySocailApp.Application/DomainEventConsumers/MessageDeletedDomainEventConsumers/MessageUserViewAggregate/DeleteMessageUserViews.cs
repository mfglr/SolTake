using MySocailApp.Application.InfrastructureServices;
using MySocailApp.Core;
using MySocailApp.Domain.MessageDomain.MessageAggregate.DomainEvents;
using MySocailApp.Domain.MessageDomain.MessageUserViewAggregate.Abstracts;

namespace MySocailApp.Application.DomainEventConsumers.MessageDeletedDomainEventConsumers.MessageUserViewAggregate
{
    public class DeleteMessageUserViews(IMessageUserViewWriteRepository messageUserViewWriteRepository, IUnitOfWork unitOfWork) : IDomainEventConsumer<MessageDeletedDomainEvent>
    {
        private readonly IMessageUserViewWriteRepository _messageUserViewWriteRepository = messageUserViewWriteRepository;
        private readonly IUnitOfWork _unitOfWork = unitOfWork;

        public async Task Handle(MessageDeletedDomainEvent notification, CancellationToken cancellationToken)
        {
            var messageUserViews = await _messageUserViewWriteRepository.GetByMessageIdAsync(notification.Message.Id, cancellationToken);
            _messageUserViewWriteRepository.DeleteRange(messageUserViews);
            await _unitOfWork.CommitAsync(cancellationToken);
        }
    }
}
