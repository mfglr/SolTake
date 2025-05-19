using Microsoft.AspNetCore.SignalR;
using MySocailApp.Application.Hubs;
using MySocailApp.Application.Queries.MessageDomain;
using MySocailApp.Domain.MessageConnectionAggregate.Abstracts;
using MySocailApp.Domain.MessageConnectionAggregate.DomainEvents;
using SolTake.Core;

namespace MySocailApp.Application.DomainEventConsumers.MessageConnectionStateChangedDomainEventConsumers.MessageConnectionAggregate
{
    public class NotifyUsers(IHubContext<MessageHub> messageHub, IMessageConnectionReadRepository messageConnectionReadRepository) : IDomainEventConsumer<MessageConnectionStateChangedDomainEvent>
    {
        private readonly IHubContext<MessageHub> _messageHub = messageHub;
        private readonly IMessageConnectionReadRepository _messageConnectionReadRepository = messageConnectionReadRepository;

        public async Task Handle(MessageConnectionStateChangedDomainEvent notification, CancellationToken cancellationToken)
        {
            var connectionIds = await _messageConnectionReadRepository.GetConnectionIdsByConnection(notification.MessageConnection, cancellationToken);

            await _messageHub.Clients
                .Clients(connectionIds)
                .SendAsync(
                    "changeMessageConnectionState",
                    MessageConnectionResponseDto.Create(notification),
                    cancellationToken
                );
        }
    }
}
