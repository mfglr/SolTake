using AutoMapper;
using Microsoft.AspNetCore.SignalR;
using MySocailApp.Application.Hubs;
using MySocailApp.Application.Queries.ConversationContenxt.MessageAggregate;
using MySocailApp.Core;
using MySocailApp.Domain.ConversationContext.MessageAggregate.DomainEvents;
using MySocailApp.Domain.ConversationContext.UserConnectionAggregate.Interfaces;

namespace MySocailApp.Application.DomainEventConsumers.MessageCreatedDomainEventConsumers
{
    public class SendMessageToReceiver(IHubContext<MessageHub> messageHub, IUserConnectionReadRepository repository, IMapper mapper) : IDomainEventConsumer<MessageCreatedDomainEvent>
    {
        private readonly IHubContext<MessageHub> _messageHub = messageHub;
        private readonly IUserConnectionReadRepository _repository = repository;
        private readonly IMapper _mapper = mapper;

        public async Task Handle(MessageCreatedDomainEvent notification, CancellationToken cancellationToken)
        {
            var connection = await _repository.GetById(notification.Message.ReceiverId, cancellationToken);
            if (connection != null && connection.IsConnected)
            {
                var message = _mapper.Map<MessageResponseDto>(notification.Message);
                await _messageHub.Clients
                    .Client(connection.ConnectionId)
                    .SendAsync("receiveMessage", message, cancellationToken);
            }
        }
    }
}
