using Microsoft.AspNetCore.SignalR;
using MySocailApp.Application.Hubs;
using MySocailApp.Core;
using MySocailApp.Domain.MessageDomain.MessageConnectionAggregate.DomainEvents;

namespace MySocailApp.Application.DomainEventConsumers.MessageConnectionStateChangedDomainEventConsumers.MessageConnectionAggregate
{
    public class NotifyUsers(MessageHub messageHub) : IDomainEventConsumer<MessageConnectionStateChangedDomainEvent>
    {
        private readonly MessageHub _messageHub = messageHub;

        public Task Handle(MessageConnectionStateChangedDomainEvent notification, CancellationToken cancellationToken)
            => _messageHub.Clients.All.SendAsync("changeMessageConnectionState", notification.MessageConnection, cancellationToken);
    }
}
