using Microsoft.AspNetCore.SignalR;
using MySocailApp.Application.Hubs;
using MySocailApp.Application.QueryRepositories;
using MySocailApp.Core;
using MySocailApp.Domain.MessageAggregate.DomainEvents;
using MySocailApp.Domain.UserConnectionAggregate.Interfaces;

namespace MySocailApp.Application.DomainEventConsumers.MessageAggregate.MessageMarkedAsReceivedDomainEventConsumers
{
    public class SendNotificationToSender(IHubContext<MessageHub> messageHub, IUserConnectionReadRepository userConnectionReadRepository, IMessageQueryRepository messageQueryRepository) : IDomainEventConsumer<MessageMarkedAsReceivedDomainEvent>
    {
        private readonly IHubContext<MessageHub> _messageHub = messageHub;
        private readonly IUserConnectionReadRepository _userConnectionReadRepository = userConnectionReadRepository;
        private readonly IMessageQueryRepository _messageQueryRepository = messageQueryRepository;

        public async Task Handle(MessageMarkedAsReceivedDomainEvent notification, CancellationToken cancellationToken)
        {
            var sender = await _userConnectionReadRepository.GetById(notification.Message.SenderId, cancellationToken);
            if (sender != null && sender.IsConnected)
            {
                var message = await _messageQueryRepository.GetMessageByIdAsync(notification.Message.SenderId, notification.Message.Id, cancellationToken);
                await _messageHub.Clients
                    .Client(sender.ConnectionId!)
                    .SendAsync("messageReceivedNotification", message, cancellationToken);
            }
        }
    }
}
