using Microsoft.AspNetCore.SignalR;
using MySocailApp.Application.Hubs;
using MySocailApp.Core;
using MySocailApp.Domain.MessageAggregate.DomainEvents;
using MySocailApp.Domain.UserConnectionAggregate.Interfaces;

namespace MySocailApp.Application.DomainEventConsumers.AddedReceiverDomainEventConsumers
{
    public class SendNotificationToOwner(IHubContext<MessageHub> messageHub, IUserConnectionReadRepository repository) : IDomainEventConsumer<AddedReceiverDomainEvent>
    {
        private readonly IHubContext<MessageHub> _messageHub = messageHub;
        private readonly IUserConnectionReadRepository _repository = repository;

        public async Task Handle(AddedReceiverDomainEvent notification, CancellationToken cancellationToken)
        {
            var connection = await _repository.GetById(notification.Message.ReceiverId, cancellationToken);
            if (connection != null && connection.IsConnected)
            {
                await _messageHub.Clients
                    .Client(connection.ConnectionId)
                    .SendAsync(
                        "messageReceivedNotification",
                        notification.Message.Id,
                        cancellationToken
                    );
            }
        }
    }
}
