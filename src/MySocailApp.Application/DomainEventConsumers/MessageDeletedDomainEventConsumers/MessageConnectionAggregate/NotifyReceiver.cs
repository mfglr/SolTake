using Microsoft.AspNetCore.SignalR;
using MySocailApp.Application.Hubs;
using MySocailApp.Core;
using MySocailApp.Domain.MessageDomain.MessageAggregate.DomainEvents;
using MySocailApp.Domain.MessageDomain.MessageConnectionAggregate.Abstracts;
using MySocailApp.Domain.MessageDomain.MessageConnectionAggregate.ValueObjects;

namespace MySocailApp.Application.DomainEventConsumers.MessageDeletedDomainEventConsumers.MessageConnectionAggregate
{
    public class NotifyReceiver(IHubContext<MessageHub> messageHub, IMessageConnectionReadRepository messageConnectionReadRepository) : IDomainEventConsumer<MessageDeletedDomainEvent>
    {
        private readonly IHubContext<MessageHub> _messageHub = messageHub;
        private readonly IMessageConnectionReadRepository _messageConnectionReadRepository = messageConnectionReadRepository;

        public async Task Handle(MessageDeletedDomainEvent notification, CancellationToken cancellationToken)
        {
            var connection = await _messageConnectionReadRepository.GetById(notification.Message.ReceiverId, cancellationToken);
            if (connection != null && connection.State != MessageConnectionState.Ofline)
                await _messageHub.Clients
                    .Client(connection.ConnectionId)
                    .SendAsync("removeMessages", notification.Message.Id, cancellationToken);
        }
    }
}
