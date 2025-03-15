using MySocailApp.Application.InfrastructureServices;
using MySocailApp.Core;
using MySocailApp.Domain.MessageDomain.MessageAggregate.DomainEvents;
using MySocailApp.Domain.MessageDomain.MessageUserRemoveAggregate.Abstracts;

namespace MySocailApp.Application.DomainEventConsumers.MessageDeletedDomainEventConsumers
{
    public class DeleteMessageUserRemovers(IMessageUserRemoveWriteRepository messageUserRemoverWriteRepository, IUnitOfWork unitOfWork) : IDomainEventConsumer<MessageDeletedDomainEvent>
    {
        private readonly IMessageUserRemoveWriteRepository _messageUserRemoverWriteRepository = messageUserRemoverWriteRepository;
        private readonly IUnitOfWork _unitOfWork = unitOfWork;

        public async Task Handle(MessageDeletedDomainEvent notification, CancellationToken cancellationToken)
        {
            var messageUserRemoves = await _messageUserRemoverWriteRepository.GetByMessageId(notification.Message.Id, cancellationToken);
            _messageUserRemoverWriteRepository.DeleteRange(messageUserRemoves);
            await _unitOfWork.CommitAsync(cancellationToken);
        }
    }
}
