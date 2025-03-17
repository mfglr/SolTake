using MySocailApp.Application.InfrastructureServices;
using MySocailApp.Core;
using MySocailApp.Domain.MessageDomain.MessageAggregate.DomainEvents;
using MySocailApp.Domain.MessageDomain.MessageUserReceiveAggregate.Abstracts;

namespace MySocailApp.Application.DomainEventConsumers.MessageDeletedDomainEventConsumers.MessageUserReceiveAggregate
{
    public class DeleteMessageUserReceives(IMessageUserReceiveWriteRepository messageUserReceiveWriteRepository, IUnitOfWork unitOfWork) : IDomainEventConsumer<MessageDeletedDomainEvent>
    {
        private readonly IMessageUserReceiveWriteRepository _messageUserReceiveWriteRepository = messageUserReceiveWriteRepository;
        private readonly IUnitOfWork _unitOfWork = unitOfWork;

        public async Task Handle(MessageDeletedDomainEvent notification, CancellationToken cancellationToken)
        {
            var receives = await _messageUserReceiveWriteRepository.GetByMessageIdAsync(notification.Message.Id,cancellationToken);
            _messageUserReceiveWriteRepository.DeleteRange(receives);
            await _unitOfWork.CommitAsync(cancellationToken);
        }
    }
}
