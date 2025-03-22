using Microsoft.AspNetCore.SignalR;
using MySocailApp.Application.Hubs;
using MySocailApp.Application.Queries.MessageDomain;
using MySocailApp.Core;
using MySocailApp.Domain.MessageDomain.MessageConnectionAggregate.DomainEvents;

namespace MySocailApp.Application.DomainEventConsumers.MessageConnectionStateChangedDomainEventConsumers.MessageConnectionAggregate
{
    public class NotifyUsers(IHubContext<MessageHub> messageHub) : IDomainEventConsumer<MessageConnectionStateChangedDomainEvent>
    {
        private readonly IHubContext<MessageHub> _messageHub = messageHub;

        public async Task Handle(MessageConnectionStateChangedDomainEvent notification, CancellationToken cancellationToken)
            => await _messageHub.Clients.All.SendAsync("changeMessageConnectionState", MessageConnectionResponseDto.Create(notification), cancellationToken);
    }
}
