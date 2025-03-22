using Microsoft.AspNetCore.SignalR;
using MySocailApp.Application.Hubs;
using MySocailApp.Core;
using MySocailApp.Domain.MessageDomain.MessageAggregate.DomainEvents;
using MySocailApp.Domain.MessageDomain.MessageConnectionAggregate.Abstracts;

namespace MySocailApp.Application.DomainEventConsumers.MessageDeletedDomainEventConsumers.MessageConnectionAggregate
{
    public class NotifyUsers(IHubContext<MessageHub> messageHub, IMessageConnectionReadRepository messageConnectionReadRepository) : IDomainEventConsumer<MessageDeletedDomainEvent>
    {
        private readonly IHubContext<MessageHub> _messageHub = messageHub;
        private readonly IMessageConnectionReadRepository _messageConnectionReadRepository = messageConnectionReadRepository;

        public async Task Handle(MessageDeletedDomainEvent notification, CancellationToken cancellationToken)
        {
            var connections = await _messageConnectionReadRepository.GetByIds(notification.Message.UserIds,cancellationToken);
            foreach (var connection in connections)
                await _messageHub
                    .Clients
                    .Client(connection.ConnectionId!)
                    .SendAsync("removeMessages", new List<int>(notification.Message.Id), cancellationToken);
        }
    }
}
