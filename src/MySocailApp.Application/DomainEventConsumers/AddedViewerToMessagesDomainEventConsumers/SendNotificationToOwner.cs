using Microsoft.AspNetCore.SignalR;
using MySocailApp.Application.Hubs;
using MySocailApp.Core;
using MySocailApp.Domain.MessageAggregate.DomainEvents;
using MySocailApp.Domain.UserConnectionAggregate.Interfaces;

namespace MySocailApp.Application.DomainEventConsumers.MessageMarkedAsViewedDomainEventConsumers
{
    public class SendNotificationToOwner(IUserConnectionReadRepository repository, IHubContext<MessageHub> messageHub) : IDomainEventConsumer<AddViewerToMessagesDomainEvent>
    {
        private readonly IUserConnectionReadRepository _repository = repository;
        private readonly IHubContext<MessageHub> _messageHub = messageHub;

        public async Task Handle(AddViewerToMessagesDomainEvent notification, CancellationToken cancellationToken)
        {
            var owner = await _repository.GetById(notification.OwnerId,cancellationToken);
            if(owner != null && owner.IsConnected)
            {
                await _messageHub.Clients
                    .Client(owner.ConnectionId)
                    .SendAsync(
                        "messagesViewedNotification",
                        new { Ids = notification.Messages.Select(x => x.Id).ToList(), notification.ViewerId },
                        cancellationToken
                    );
            }
        }
    }
}
