using Microsoft.AspNetCore.SignalR;
using MySocailApp.Application.Hubs;
using MySocailApp.Core;
using MySocailApp.Domain.ConversationContext.MessageAggregate.DomainEvents;
using MySocailApp.Domain.ConversationContext.UserConnectionAggregate.Interfaces;

namespace MySocailApp.Application.DomainEventConsumers.MessageMarkedAsViewedDomainEventConsumers
{
    public class SendNotificationToSender(IUserConnectionReadRepository repository, IHubContext<MessageHub> messageHub) : IDomainEventConsumer<MessageMarkedAsViewedDomainEvent>
    {
        private readonly IUserConnectionReadRepository _repository = repository;
        private readonly IHubContext<MessageHub> _messageHub = messageHub;

        public async Task Handle(MessageMarkedAsViewedDomainEvent notification, CancellationToken cancellationToken)
        {
            var sender = await _repository.GetById(notification.Message.SenderId,cancellationToken);
            if(sender != null && sender.IsConnected)
            {
                await _messageHub.Clients.Client(sender.ConnectionId).SendAsync("messageViewedNotification", notification.Message.Id, cancellationToken);
            }
        }
    }
}
