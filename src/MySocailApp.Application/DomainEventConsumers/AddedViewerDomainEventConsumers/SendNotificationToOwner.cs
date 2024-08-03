using Microsoft.AspNetCore.SignalR;
using MySocailApp.Application.Hubs;
using MySocailApp.Core;
using MySocailApp.Domain.MessageAggregate.DomainEvents;
using MySocailApp.Domain.UserConnectionAggregate.Interfaces;

namespace MySocailApp.Application.DomainEventConsumers.AddedViewerDomainEventConsumers
{
    public class SendNotificationToOwner(IUserConnectionReadRepository repository, IHubContext<MessageHub> messageHub) : IDomainEventConsumer<AddViewerDomainEvent>
    {
        private readonly IUserConnectionReadRepository _repository = repository;
        private readonly IHubContext<MessageHub> _messageHub = messageHub;

        public async Task Handle(AddViewerDomainEvent notification, CancellationToken cancellationToken)
        {
            var owner = await _repository.GetById(notification.Message.ReceiverId, cancellationToken);
            if (owner != null && owner.IsConnected)
            {
                await _messageHub.Clients
                    .Client(owner.ConnectionId)
                    .SendAsync(
                        "messageViewedNotification",
                        notification.Message.Id,
                        cancellationToken
                    );
            }
        }
    }
}
