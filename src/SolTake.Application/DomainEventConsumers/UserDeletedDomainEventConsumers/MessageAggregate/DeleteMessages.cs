using MediatR;
using MySocailApp.Application.InfrastructureServices;
using SolTake.Domain.UserAggregate.DomainEvents;
using SolTake.Core;
using SolTake.Domain.MessageAggregate.Abstracts;
using SolTake.Domain.MessageAggregate.DomainEvents;

namespace MySocailApp.Application.DomainEventConsumers.UserDeletedDomainEventConsumers.MessageAggregate
{
    public class DeleteMessages(IMessageWriteRepository messageWriteRepository, IUnitOfWork unitOfWork, IPublisher publisher) : IDomainEventConsumer<UserDeletedDomainEvent>
    {
        private readonly IMessageWriteRepository _messageWriteRepository = messageWriteRepository;
        private readonly IUnitOfWork _unitOfWork = unitOfWork;
        private readonly IPublisher _publisher = publisher;

        public async Task Handle(UserDeletedDomainEvent notification, CancellationToken cancellationToken)
        {
            var messages = await _messageWriteRepository.GetUserMessages(notification.User.Id, cancellationToken);
            _messageWriteRepository.DeleteRange(messages);
            await _unitOfWork.CommitAsync(cancellationToken);

            foreach (var message in messages)
                await _publisher.Publish(new MessageDeletedDomainEvent(message));
        }
    }
}
