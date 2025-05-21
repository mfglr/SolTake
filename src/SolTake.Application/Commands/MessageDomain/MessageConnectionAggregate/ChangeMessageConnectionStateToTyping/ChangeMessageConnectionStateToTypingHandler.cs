using MediatR;
using MySocailApp.Application.InfrastructureServices;
using SolTake.Domain.MessageConnectionAggregate.DomainEvents;
using SolTake.Domain.MessageConnectionAggregate.Exceptions;
using SolTake.Domain.MessageConnectionAggregate.Abstracts;

namespace MySocailApp.Application.Commands.MessageDomain.MessageConnectionAggregate.ChangeMessageConnectionStateToTyping
{
    public class ChangeMessageConnectionStateToTypingHandler(IAccessTokenReader accessTokenReader, IUnitOfWork unitOfWork, IPublisher publisher, IMessageConnectionWriteRepository messageConnectionWriteRepository) : IRequestHandler<ChangeMessageConnectionStateToTypingDto>
    {
        private readonly IAccessTokenReader _accessTokenReader = accessTokenReader;
        private readonly IUnitOfWork _unitOfWork = unitOfWork;
        private readonly IPublisher _publisher = publisher;
        private readonly IMessageConnectionWriteRepository _messageConnectionWriteRepository = messageConnectionWriteRepository;

        public async Task Handle(ChangeMessageConnectionStateToTypingDto request, CancellationToken cancellationToken)
        {
            var userId = _accessTokenReader.GetRequiredAccountId();
            var messageConnection = 
                await _messageConnectionWriteRepository.GetByIdAsync(userId, cancellationToken) ??
                throw new MessageConnectionNotFoundException();

            messageConnection.ChangeStateToTyping(request.UserId);
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
