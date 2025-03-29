using Microsoft.AspNetCore.SignalR;
using MySocailApp.Application.Hubs;
using MySocailApp.Application.Queries.MessageDomain;
using MySocailApp.Core;
using MySocailApp.Domain.MessageDomain.MessageAggregate.DomainEvents;
using MySocailApp.Domain.MessageDomain.MessageConnectionAggregate.Abstracts;
using MySocailApp.Domain.MessageDomain.MessageConnectionAggregate.ValueObjects;

namespace MySocailApp.Application.DomainEventConsumers.MessageCreatedDomainEventConsumers.MessgeConnectionAggregate
{
    public class SendMessageToReceiver(IHubContext<MessageHub> messageHub, IMessageConnectionReadRepository userConnectionReadRepository) : IDomainEventConsumer<MessageCreatedDomainEvent>
    {
        private readonly IHubContext<MessageHub> _messageHub = messageHub;
        private readonly IMessageConnectionReadRepository _messageConnectionReadRepository = userConnectionReadRepository;

        public async Task Handle(MessageCreatedDomainEvent notification, CancellationToken cancellationToken)
        {
            var receiver = await _messageConnectionReadRepository.GetById(notification.Message.ReceiverId, cancellationToken);
            if (receiver == null || receiver.State == MessageConnectionState.Ofline) return;

            await _messageHub.Clients.Client(receiver.ConnectionId).SendAsync("receiveMessage", MessageResponseDto.Create(notification),cancellationToken);
        }
    }
}
