using AutoMapper;
using Microsoft.AspNetCore.SignalR;
using MySocailApp.Application.Hubs;
using MySocailApp.Application.Queries.MessageAggregate;
using MySocailApp.Core;
using MySocailApp.Domain.MessageAggregate.DomainEvents;
using MySocailApp.Domain.MessageAggregate.Interfaces;
using MySocailApp.Domain.UserConnectionAggregate.Interfaces;

namespace MySocailApp.Application.DomainEventConsumers.MessageMarkedAsViewedDomainEventConsumers
{
    public class SendNotificationToSender(IUserConnectionReadRepository repository, IHubContext<MessageHub> messageHub, IMessageReadRepository messageReadRepository, IMapper mapper) : IDomainEventConsumer<MessageMarkedAsViewedDomainEvent>
    {
        private readonly IUserConnectionReadRepository _repository = repository;
        private readonly IHubContext<MessageHub> _messageHub = messageHub;
        private readonly IMessageReadRepository _messageReadRepository = messageReadRepository;
        private readonly IMapper _mapper = mapper;

        public async Task Handle(MessageMarkedAsViewedDomainEvent notification, CancellationToken cancellationToken)
        {
            var sender = await _repository.GetById(notification.Message.SenderId, cancellationToken);
            if (sender != null && sender.IsConnected)
            {
                var message = _mapper.Map<MessageResponseDto>(
                    await _messageReadRepository.GetMessageByIdAsync(notification.Message.Id, cancellationToken)
                );
                await _messageHub.Clients
                    .Client(sender.ConnectionId)
                    .SendAsync("messageViewedNotification",message,cancellationToken);
            }
        }
    }
}
