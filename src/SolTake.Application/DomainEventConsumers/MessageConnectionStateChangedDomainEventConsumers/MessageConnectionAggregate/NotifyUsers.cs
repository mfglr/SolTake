using Microsoft.AspNetCore.SignalR;
using SolTake.Application.Hubs;
using SolTake.Application.Queries.MessageDomain;
using SolTake.Core;
using SolTake.Domain.MessageConnectionAggregate.Abstracts;
using SolTake.Domain.MessageConnectionAggregate.DomainEvents;

namespace SolTake.Application.DomainEventConsumers.MessageConnectionStateChangedDomainEventConsumers.MessageConnectionAggregate
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
