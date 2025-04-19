using MediatR;
using MySocailApp.Application.InfrastructureServices;
using MySocailApp.Domain.MessageConnectionAggregate.Abstracts;
using MySocailApp.Domain.MessageConnectionAggregate.DomainEvents;
using MySocailApp.Domain.MessageConnectionAggregate.Exceptions;

namespace MySocailApp.Application.Commands.MessageDomain.MessageConnectionAggregate.ChangeMessageConnectionStateToFocused
{
    public class ChangeMessageConnectionStateToFocusedHandler(IMessageConnectionWriteRepository messageConnectionWriteRepository, IUnitOfWork unitOfWork, IPublisher publisher, IAccessTokenReader accessTokenReader) : IRequestHandler<ChangeMessageConnectionStateToFocusedDto>
    {
        private readonly IAccessTokenReader _accessTokenReader = accessTokenReader;
        private readonly IMessageConnectionWriteRepository _messageConnectionWriteRepository = messageConnectionWriteRepository;
        private readonly IUnitOfWork _unitOfWork = unitOfWork;
        private readonly IPublisher _publisher = publisher;

        public async Task Handle(ChangeMessageConnectionStateToFocusedDto request, CancellationToken cancellationToken)
        {
            var userId = _accessTokenReader.GetRequiredAccountId();
            var messageConnection =
                await _messageConnectionWriteRepository.GetByIdAsync(userId, cancellationToken) ??
                throw new MessageConnectionNotFoundException();

            messageConnection.ChangeStateToFocused(request.UserId);
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
