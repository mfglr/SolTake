using MediatR;
using MySocailApp.Application.InfrastructureServices;
using MySocailApp.Domain.MessageDomain.MessageConnectionAggregate.Abstracts;
using MySocailApp.Domain.MessageDomain.MessageConnectionAggregate.DomainEvents;
using MySocailApp.Domain.MessageDomain.MessageConnectionAggregate.ValueObjects;

namespace MySocailApp.Application.Commands.MessageDomain.MessageConnectionAggregate.DisconnectMessageHub
{
    public class DisconnectMessageHubHandler(IUnitOfWork unitOfWork, IMessageConnectionWriteRepository repository, IAccessTokenReader accessTokenReader, IPublisher publisher) : IRequestHandler<DisconnectMessageHubDto>
    {
        private readonly IAccessTokenReader _accessTokenReader = accessTokenReader;
        private readonly IMessageConnectionWriteRepository _repository = repository;
        private readonly IUnitOfWork _unitOfWork = unitOfWork;
        private readonly IPublisher _publisher = publisher;

        public async Task Handle(DisconnectMessageHubDto request, CancellationToken cancellationToken)
        {
            var userId = _accessTokenReader.GetRequiredAccountId();
            var messageConnection = (await _repository.GetByIdAsync(userId, cancellationToken))!;
            messageConnection.ChangeState(MessageConnectionState.Ofline);
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
