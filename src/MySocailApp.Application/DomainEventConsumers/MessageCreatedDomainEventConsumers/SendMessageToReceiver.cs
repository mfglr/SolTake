using AutoMapper;
using Microsoft.AspNetCore.SignalR;
using MySocailApp.Application.Hubs;
using MySocailApp.Application.Queries.MessageAggregate;
using MySocailApp.Core;
using MySocailApp.Domain.MessageAggregate.DomainEvents;
using MySocailApp.Domain.MessageAggregate.Interfaces;
using MySocailApp.Domain.UserConnectionAggregate.Interfaces;

namespace MySocailApp.Application.DomainEventConsumers.MessageCreatedDomainEventConsumers
{
    public class SendMessageToReceiver(IHubContext<MessageHub> messageHub, IUserConnectionReadRepository repository, IMapper mapper, IMessageReadRepository messageRepository) : IDomainEventConsumer<MessageCreatedDomainEvent>
    {
        private readonly IHubContext<MessageHub> _messageHub = messageHub;
        private readonly IUserConnectionReadRepository _repository = repository;
        private readonly IMapper _mapper = mapper;
        private readonly IMessageReadRepository _messageRepository = messageRepository;

        public async Task Handle(MessageCreatedDomainEvent notification, CancellationToken cancellationToken)
        {
            var receiver = await _repository.GetById(notification.Message.ReceiverId, cancellationToken);
            if (receiver != null && receiver.IsConnected)
            {
                var message = _mapper.Map<MessageResponseDto>(
                    await _messageRepository.GetMessageByIdAsync(notification.Message.Id, cancellationToken)
                );
                await _messageHub.Clients
                    .Client(receiver.ConnectionId)
                    .SendAsync("receiveMessage1", message, cancellationToken);
                await _messageHub.Clients
                    .Client(receiver.ConnectionId)
                    .SendAsync("receiveMessage2", message, cancellationToken);
            }
        }
    }
}
