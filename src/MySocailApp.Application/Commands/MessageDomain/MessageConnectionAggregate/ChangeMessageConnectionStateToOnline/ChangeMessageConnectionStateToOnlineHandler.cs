using MediatR;
using MySocailApp.Application.InfrastructureServices;
using MySocailApp.Domain.MessageDomain.MessageConnectionAggregate.Abstracts;
using MySocailApp.Domain.MessageDomain.MessageConnectionAggregate.DomainEvents;
using MySocailApp.Domain.MessageDomain.MessageConnectionAggregate.Exceptions;

namespace MySocailApp.Application.Commands.MessageDomain.MessageConnectionAggregate.ChangeMessageConnectionStateToOnline
{
    public class ChangeMessageConnectionStateToOnlineHandler(IAccessTokenReader accessTokenReader, IUnitOfWork unitOfWork, IPublisher publisher, IMessageConnectionWriteRepository messageConnectionWriteRepository) : IRequestHandler<ChangeMessageConnectionStateToOnlineDto>
    {

        private readonly IAccessTokenReader _accessTokenReader = accessTokenReader;
        private readonly IUnitOfWork _unitOfWork = unitOfWork;
        private readonly IPublisher _publisher = publisher;
        private readonly IMessageConnectionWriteRepository _messageConnectionWriteRepository = messageConnectionWriteRepository;

        public async Task Handle(ChangeMessageConnectionStateToOnlineDto request, CancellationToken cancellationToken)
        {
            var userId = _accessTokenReader.GetRequiredAccountId();
            var messageConnection = 
                await _messageConnectionWriteRepository.GetByIdAsync(userId, cancellationToken) ??
                throw new MessageConnectionNotFoundException();

            messageConnection.ChangeStateToOnline();
            await _unitOfWork.CommitAsync(cancellationToken);

            await _publisher
                .Publish(
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
