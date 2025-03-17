using Microsoft.AspNetCore.SignalR;
using MySocailApp.Application.Hubs;
using MySocailApp.Application.Queries.MessageAggregate;
using MySocailApp.Core;
using MySocailApp.Domain.MessageDomain.MessageAggregate.DomainEvents;
using MySocailApp.Domain.MessageDomain.MessageConnectionAggregate.Abstracts;

namespace MySocailApp.Application.DomainEventConsumers.MessageCreatedDomainEventConsumers.MessgeConnectionAggregate
{
    public class SendMessageToReceiver(IHubContext<MessageHub> messageHub, IMessageConnectionReadRepository userConnectionReadRepository) : IDomainEventConsumer<MessageCreatedDomainEvent>
    {
        private readonly IHubContext<MessageHub> _messageHub = messageHub;
        private readonly IMessageConnectionReadRepository _userConnectionReadRepository = userConnectionReadRepository;

        public async Task Handle(MessageCreatedDomainEvent notification, CancellationToken cancellationToken)
        {
            var receiver = await _userConnectionReadRepository.GetById(notification.Message.ReceiverId, cancellationToken);
            if (receiver != null && receiver.IsOnline)
            {
                await _messageHub.Clients
                    .Client(receiver.ConnectionId!)
                    .SendAsync("receiveMessage", MessageResponseDto.Create(notification), cancellationToken);
            }
        }
    }
}
