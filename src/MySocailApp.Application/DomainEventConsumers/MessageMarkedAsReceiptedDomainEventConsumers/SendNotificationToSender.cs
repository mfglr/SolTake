using Microsoft.AspNetCore.SignalR;
using MySocailApp.Application.Hubs;
using MySocailApp.Core;
using MySocailApp.Domain.ConversationContext.MessageAggregate.DomainEvents;
using MySocailApp.Domain.ConversationContext.UserConnectionAggregate.Interfaces;

namespace MySocailApp.Application.DomainEventConsumers.MessageMarkedAsReceiptedDomainEventConsumers
{
    public class SendNotificationToSender(IHubContext<MessageHub> messageHub, IUserConnectionReadRepository repository) : IDomainEventConsumer<MessageMarkedAsReceiptedDomainEvent>
    {
        private readonly IHubContext<MessageHub> _messageHub = messageHub;
        private readonly IUserConnectionReadRepository _repository = repository;

        public async Task Handle(MessageMarkedAsReceiptedDomainEvent notification, CancellationToken cancellationToken)
        {
            var connection = await _repository.GetById(notification.Message.SenderId, cancellationToken);
            if (connection != null && connection.IsConnected)
            {
                await _messageHub.Clients.Client(connection.ConnectionId).SendAsync("messageReceiptedNotification", notification.Message.Id, cancellationToken);
            }
        }
    }
}
