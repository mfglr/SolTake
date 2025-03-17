using Microsoft.AspNetCore.SignalR;
using MySocailApp.Application.Hubs;
using MySocailApp.Application.QueryRepositories;
using MySocailApp.Core;
using MySocailApp.Domain.MessageDomain.MessageAggregate.DomainEvents;
using MySocailApp.Domain.MessageDomain.MessageConnectionAggregate.Abstracts;

namespace MySocailApp.Application.DomainEventConsumers.MessageAggregate.MessageMarkedAsViewedDomainEventConsumers
{
    public class SendNotificationToSender(IMessageConnectionReadRepository userConnectionReadRepository, IHubContext<MessageHub> messageHub, IMessageQueryRepository messageQueryRepository) : IDomainEventConsumer<MessageMarkedAsViewedDomainEvent>
    {
        private readonly IMessageConnectionReadRepository _userConnectionReadRepository = userConnectionReadRepository;
        private readonly IHubContext<MessageHub> _messageHub = messageHub;
        private readonly IMessageQueryRepository _messageQueryRepository = messageQueryRepository;

        public async Task Handle(MessageMarkedAsViewedDomainEvent notification, CancellationToken cancellationToken)
        {
            var sender = await _userConnectionReadRepository.GetById(notification.Message.SenderId, cancellationToken);
            if (sender != null && sender.IsOnline)
            {
                var message = await _messageQueryRepository.GetMessageByIdAsync(notification.Message.SenderId, notification.Message.Id, cancellationToken);
                await _messageHub.Clients
                    .Client(sender.ConnectionId!)
                    .SendAsync("messageViewedNotification", message, cancellationToken);
            }
        }
    }
}
