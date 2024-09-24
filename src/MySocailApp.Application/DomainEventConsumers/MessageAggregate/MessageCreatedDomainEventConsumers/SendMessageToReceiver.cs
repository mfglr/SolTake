using Microsoft.AspNetCore.SignalR;
using MySocailApp.Application.Hubs;
using MySocailApp.Application.QueryRepositories;
using MySocailApp.Core;
using MySocailApp.Domain.MessageAggregate.DomainEvents;
using MySocailApp.Domain.UserConnectionAggregate.Interfaces;

namespace MySocailApp.Application.DomainEventConsumers.MessageAggregate.MessageCreatedDomainEventConsumers
{
    public class SendMessageToReceiver(IHubContext<MessageHub> messageHub, IUserConnectionReadRepository repository, IMessageQueryRepository messageQueryRepository) : IDomainEventConsumer<MessageCreatedDomainEvent>
    {
        private readonly IHubContext<MessageHub> _messageHub = messageHub;
        private readonly IUserConnectionReadRepository _repository = repository;
        private readonly IMessageQueryRepository _messageQueryRepository = messageQueryRepository;

        public async Task Handle(MessageCreatedDomainEvent notification, CancellationToken cancellationToken)
        {
            var receiver = await _repository.GetById(notification.Message.ReceiverId, cancellationToken);
            if (receiver != null && receiver.IsConnected)
            {
                var message = await _messageQueryRepository.GetMessageByIdAsync(notification.Message.ReceiverId, notification.Message.Id, cancellationToken);
                await _messageHub.Clients
                    .Client(receiver.ConnectionId!)
                    .SendAsync("receiveMessage", message, cancellationToken);
            }
        }
    }
}
