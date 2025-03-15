using Microsoft.AspNetCore.SignalR;
using MySocailApp.Application.Hubs;
using MySocailApp.Application.QueryRepositories;
using MySocailApp.Core;
using MySocailApp.Domain.MessageDomain.MessageAggregate.DomainEvents;
using MySocailApp.Domain.MessageDomain.MessageConnectionAggregate.Abstracts;

namespace MySocailApp.Application.DomainEventConsumers.MessageCreatedDomainEventConsumers.MessgeAggregate
{
    public class SendMessageToReceiver(IHubContext<MessageHub> messageHub, IMessageConnectionReadRepository userConnectionReadRepository, IMessageQueryRepository messageQueryRepository) : IDomainEventConsumer<MessageCreatedDomainEvent>
    {
        private readonly IHubContext<MessageHub> _messageHub = messageHub;
        private readonly IMessageConnectionReadRepository _userConnectionReadRepository = userConnectionReadRepository;
        private readonly IMessageQueryRepository _messageQueryRepository = messageQueryRepository;

        public async Task Handle(MessageCreatedDomainEvent notification, CancellationToken cancellationToken)
        {
            var receiver = await _userConnectionReadRepository.GetById(notification.Message.ReceiverId, cancellationToken);
            if (receiver != null && receiver.IsConnected)
            {
                var message = await _messageQueryRepository.GetMessageByIdAsync(notification.Message.ReceiverId, notification.Message.Id, cancellationToken);
                await _messageHub.Clients
                    .Client(receiver.ConnectionId!)
                    .SendAsync("receiveMessage", message, cancellationToken);
            }
        }
    }
}
