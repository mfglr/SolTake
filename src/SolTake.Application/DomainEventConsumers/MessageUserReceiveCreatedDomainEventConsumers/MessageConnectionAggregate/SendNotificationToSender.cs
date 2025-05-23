using Microsoft.AspNetCore.SignalR;
using SolTake.Application.Hubs;
using SolTake.Domain.MessageUserReceiveAggregate.DomainEvents;
using SolTake.Core;
using SolTake.Domain.MessageAggregate.Abstracts;
using SolTake.Domain.MessageConnectionAggregate.Abstracts;
using SolTake.Domain.MessageConnectionAggregate.ValueObjects;

namespace SolTake.Application.DomainEventConsumers.MessageUserReceiveCreatedDomainEventConsumers.MessageConnectionAggregate
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
