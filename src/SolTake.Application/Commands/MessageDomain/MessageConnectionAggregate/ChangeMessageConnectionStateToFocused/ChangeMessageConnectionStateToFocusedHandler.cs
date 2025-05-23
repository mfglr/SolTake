using MediatR;
using SolTake.Application.InfrastructureServices;
using SolTake.Domain.MessageConnectionAggregate.DomainEvents;
using SolTake.Domain.MessageConnectionAggregate.Exceptions;
using SolTake.Domain.MessageConnectionAggregate.Abstracts;

namespace SolTake.Application.Commands.MessageDomain.MessageConnectionAggregate.ChangeMessageConnectionStateToFocused
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
