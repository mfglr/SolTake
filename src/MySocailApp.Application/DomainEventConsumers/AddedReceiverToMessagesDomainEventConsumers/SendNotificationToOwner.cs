using Microsoft.AspNetCore.SignalR;
using MySocailApp.Application.Hubs;
using MySocailApp.Core;
using MySocailApp.Domain.MessageAggregate.DomainEvents;
using MySocailApp.Domain.UserConnectionAggregate.Interfaces;

namespace MySocailApp.Application.DomainEventConsumers.AddedReceiverToMessagesDomainEventConsumers
{
    public class SendNotificationToOwner(IHubContext<MessageHub> messageHub, IUserConnectionReadRepository repository) : IDomainEventConsumer<AddedReceiverToMessagesDomainEvent>
    {
        private readonly IHubContext<MessageHub> _messageHub = messageHub;
        private readonly IUserConnectionReadRepository _repository = repository;

        public async Task Handle(AddedReceiverToMessagesDomainEvent notification, CancellationToken cancellationToken)
        {
            var connection = await _repository.GetById(notification.OwnerId, cancellationToken);
            if(connection != null && connection.IsConnected)
            {
                await _messageHub.Clients
                    .Client(connection.ConnectionId)
                    .SendAsync(
                        "messagesReceivedNotification",
                        new { Ids = notification.Messages.Select(x => x.Id).ToList(), notification.ReceiverId },
                        cancellationToken
                    );
            }
        }
    }
}
