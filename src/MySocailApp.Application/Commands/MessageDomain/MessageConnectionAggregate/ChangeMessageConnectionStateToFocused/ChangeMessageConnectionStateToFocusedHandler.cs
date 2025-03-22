using MediatR;
using MySocailApp.Application.InfrastructureServices;
using MySocailApp.Domain.MessageDomain.MessageConnectionAggregate.Abstracts;
using MySocailApp.Domain.MessageDomain.MessageConnectionAggregate.DomainEvents;
using MySocailApp.Domain.MessageDomain.MessageConnectionAggregate.Exceptions;

namespace MySocailApp.Application.Commands.MessageDomain.MessageConnectionAggregate.ChangeMessageConnectionStateToFocused
{
    public class ChangeMessageConnectionStateToFocusedHandler(IMessageConnectionWriteRepository messageConnectionWriteRepository, IUnitOfWork unitOfWork, IUserAccessor userAccessor, IPublisher publisher) : IRequestHandler<ChangeMessageConnectionStateToFocusedDto>
    {
        private readonly IMessageConnectionWriteRepository _messageConnectionWriteRepository = messageConnectionWriteRepository;
        private readonly IUnitOfWork _unitOfWork = unitOfWork;
        private readonly IUserAccessor _userAccessor = userAccessor;
        private readonly IPublisher _publisher = publisher;

        public async Task Handle(ChangeMessageConnectionStateToFocusedDto request, CancellationToken cancellationToken)
        {
            var messageConnection =
                await _messageConnectionWriteRepository.GetByIdAsync(_userAccessor.User.Id, cancellationToken) ??
                throw new MessageConnectionNotFoundException();
            messageConnection.ChangeStateToFocused(request.UserId);
            await _unitOfWork.CommitAsync(cancellationToken);

            await _publisher
                .Publish(
                    new MessageConnectionStateChangedDomainEvent(
                        messageConnection,
                        _userAccessor.User.UserName.Value,
                        _userAccessor.User.Image
                    ),
                    cancellationToken
                );

        }
    }
}
