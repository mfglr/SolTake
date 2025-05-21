using MediatR;
using MySocailApp.Application.InfrastructureServices;
using SolTake.Domain.MessageConnectionAggregate.DomainEvents;
using SolTake.Domain.MessageConnectionAggregate.Abstracts;
using SolTake.Domain.MessageConnectionAggregate.Entities;

namespace MySocailApp.Application.Commands.MessageDomain.MessageConnectionAggregate.ConnectMessageHub
{
    public class ConnectMessageHubHandler(IMessageConnectionWriteRepository repository, IUnitOfWork unitOfWork, IAccessTokenReader accessTokenReader, IPublisher publisher) : IRequestHandler<ConnectMessageHubDto>
    {
        private readonly IAccessTokenReader _accessTokenReader = accessTokenReader;
        private readonly IMessageConnectionWriteRepository _repository = repository;
        private readonly IUnitOfWork _unitOfWork = unitOfWork;
        private readonly IPublisher _publisher = publisher;

        public async Task Handle(ConnectMessageHubDto request, CancellationToken cancellationToken)
        {
            var userId = _accessTokenReader.GetRequiredAccountId();
            var messageConnection = await _repository.GetByIdAsync(userId, cancellationToken);
            if (messageConnection == null)
            {
                messageConnection = MessageConnection.Create(userId, request.ConnectionId);
                await _repository.CreateAsync(messageConnection, cancellationToken);
            }
            messageConnection.Connect(request.ConnectionId);
            await _unitOfWork.CommitAsync(cancellationToken);

            await _publisher.Publish(
                new MessageConnectionStateChangedDomainEvent(
                    messageConnection,
                    _accessTokenReader.GetUserName()!,
                    _accessTokenReader.GetMedia()
                ),
                cancellationToken
            );
        }
    }
}
