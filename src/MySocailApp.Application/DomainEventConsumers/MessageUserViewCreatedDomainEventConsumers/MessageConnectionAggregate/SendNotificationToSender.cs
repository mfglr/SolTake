using Microsoft.AspNetCore.SignalR;
using MySocailApp.Application.Hubs;
using MySocailApp.Core;
using MySocailApp.Domain.MessageDomain.MessageAggregate.Abstracts;
using MySocailApp.Domain.MessageDomain.MessageConnectionAggregate.Abstracts;
using MySocailApp.Domain.MessageDomain.MessageConnectionAggregate.ValueObjects;
using MySocailApp.Domain.MessageDomain.MessageUserViewAggregate.DomainEvents;

namespace MySocailApp.Application.DomainEventConsumers.MessageUserViewCreatedDomainEventConsumers.MessageConnectionAggregate
{
    public class SendNotificationToSender(IMessageConnectionReadRepository messageConnectionReadRepository, IHubContext<MessageHub> messageHub, IMessageReadRepository messageReadRepository) : IDomainEventConsumer<MessageUserViewCreatedDomainEvent>
    {
        private readonly IMessageConnectionReadRepository _messageConnectionReadRepository = messageConnectionReadRepository;
        private readonly IHubContext<MessageHub> _messageHub = messageHub;
        private readonly IMessageReadRepository _messageReadRepository = messageReadRepository;

        public async Task Handle(MessageUserViewCreatedDomainEvent notification, CancellationToken cancellationToken)
        {
            var senderId = await _messageReadRepository.GetMessageSenderIdAsync(notification.MessageUserView.MessageId, cancellationToken);
            if (senderId == 0) return;

            var sender = await _messageConnectionReadRepository.GetById(senderId, cancellationToken);
            if (sender == null || sender.State == MessageConnectionState.Ofline) return;

            await _messageHub.Clients
                .Client(sender.ConnectionId)
                .SendAsync("messageViewedNotification", notification.MessageUserView.MessageId, cancellationToken);
        }
    }
}
