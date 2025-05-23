using Microsoft.AspNetCore.SignalR;
using SolTake.Application.Hubs;
using SolTake.Application.Queries.MessageDomain;
using SolTake.Core;
using SolTake.Domain.MessageAggregate.DomainEvents;
using SolTake.Domain.MessageConnectionAggregate.Abstracts;
using SolTake.Domain.MessageConnectionAggregate.ValueObjects;

namespace SolTake.Application.DomainEventConsumers.MessageCreatedDomainEventConsumers.MessgeConnectionAggregate
{
    public class SendMessageToReceiver(IHubContext<MessageHub> messageHub, IMessageConnectionReadRepository userConnectionReadRepository) : IDomainEventConsumer<MessageCreatedDomainEvent>
    {
        private readonly IHubContext<MessageHub> _messageHub = messageHub;
        private readonly IMessageConnectionReadRepository _messageConnectionReadRepository = userConnectionReadRepository;

        public async Task Handle(MessageCreatedDomainEvent notification, CancellationToken cancellationToken)
        {
            var receiver = await _messageConnectionReadRepository.GetById(notification.Message.ReceiverId, cancellationToken);
            if (receiver == null || receiver.State == MessageConnectionState.Ofline) return;

            var message = MessageResponseDto.Create(notification);
            await _messageHub.Clients.Client(receiver.ConnectionId).SendAsync("receiveMessage", message, cancellationToken);
            await _messageHub.Clients.Client(receiver.ConnectionId).SendAsync("receiveMessage1", message, cancellationToken);
        }
    }
}
