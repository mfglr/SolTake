using MediatR;
using MySocailApp.Application.InfrastructureServices;
using MySocailApp.Core;
using MySocailApp.Domain.MessageDomain.MessageAggregate.Abstracts;
using MySocailApp.Domain.MessageDomain.MessageAggregate.DomainEvents;
using MySocailApp.Domain.MessageDomain.MessageUserRemoveAggregate.Abstracts;
using MySocailApp.Domain.MessageDomain.MessageUserRemoveAggregate.DomainEvents;

namespace MySocailApp.Application.DomainEventConsumers.MessageUserRemoveCreatedDomainEventConsumers.MessageAggregate
{
    public class DeleteMessage(IMessageWriteRepository messageWriteRepository, IMessageUserRemoveReadRepository messageUserRemoveReadRepository, IUnitOfWork unitOfWork, IPublisher publisher) : IDomainEventConsumer<MessageUserRemoveCreatedDomainEvent>
    {
        private readonly IMessageWriteRepository _messageWriteRepository = messageWriteRepository;
        private readonly IMessageUserRemoveReadRepository _messageUserRemoveReadRepository = messageUserRemoveReadRepository;
        private readonly IUnitOfWork _unitOfWork = unitOfWork;
        private readonly IPublisher _publisher = publisher;

        public async Task Handle(MessageUserRemoveCreatedDomainEvent notification, CancellationToken cancellationToken)
        {
            var message = await _messageWriteRepository.GetById(notification.MessageUserRemove.MessageId, cancellationToken);
            
            if (message != null && await _messageUserRemoveReadRepository.IsDeletedAllUsersAsync(notification.MessageUserRemove.MessageId,cancellationToken))
            {
                _messageWriteRepository.Delete(message);
                await _unitOfWork.CommitAsync(cancellationToken);
                
                await _publisher.Publish(new MessageDeletedDomainEvent(message));
            }

        }
    }
}
