using Microsoft.AspNetCore.SignalR;
using MySocailApp.Application.Hubs;
using MySocailApp.Core;
using MySocailApp.Domain.MessageConnectionAggregate.Abstracts;
using MySocailApp.Domain.MessageConnectionAggregate.ValueObjects;
using MySocailApp.Domain.MessageDomain.MessageAggregate.Abstracts;
using MySocailApp.Domain.MessageUserReceiveAggregate.DomainEvents;

namespace MySocailApp.Application.DomainEventConsumers.MessageUserReceiveCreatedDomainEventConsumers.MessageConnectionAggregate
{
    public class SendNotificationToSender(IHubContext<MessageHub> messageHub, IMessageConnectionReadRepository userConnectionReadRepository, IMessageReadRepository messageReadRepository) : IDomainEventConsumer<MessageUserReceiveCreatedDomainEvent>
    {
        private readonly IHubContext<MessageHub> _messageHub = messageHub;
        private readonly IMessageConnectionReadRepository _userConnectionReadRepository = userConnectionReadRepository;
        private readonly IMessageReadRepository _messageReadRepository = messageReadRepository;

        public async Task Handle(MessageUserReceiveCreatedDomainEvent notification, CancellationToken cancellationToken)
        {
            var senderId = await _messageReadRepository.GetMessageSenderIdAsync(notification.MessageUserReceive.MessageId,cancellationToken);
            if (senderId == 0) return;
            
            var sender = await _userConnectionReadRepository.GetById(senderId, cancellationToken);
            if (sender == null || sender.State == MessageConnectionState.Ofline) return;

            await _messageHub.Clients
                .Client(sender.ConnectionId)
                .SendAsync("messageReceivedNotification", notification.MessageUserReceive.MessageId, cancellationToken);
        }
    }
}
