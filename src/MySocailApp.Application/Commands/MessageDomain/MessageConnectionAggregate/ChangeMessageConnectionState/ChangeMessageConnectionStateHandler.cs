using MediatR;
using MySocailApp.Application.InfrastructureServices;
using MySocailApp.Domain.MessageDomain.MessageConnectionAggregate.Abstracts;
using MySocailApp.Domain.MessageDomain.MessageConnectionAggregate.Exceptions;

namespace MySocailApp.Application.Commands.MessageDomain.MessageConnectionAggregate.ChangeMessageConnectionState
{
    public class ChangeMessageConnectionStateHandler(IMessageConnectionWriteRepository messageConnectionWriteRepository, IUnitOfWork unitOfWork, IUserAccessor userAccessor) : IRequestHandler<ChangeMessageConnectionStateDto>
    {
        private readonly IMessageConnectionWriteRepository _messageConnectionWriteRepository = messageConnectionWriteRepository;
        private readonly IUnitOfWork _unitOfWork = unitOfWork;
        private readonly IUserAccessor _userAccessor = userAccessor;

        public async Task Handle(ChangeMessageConnectionStateDto request, CancellationToken cancellationToken)
        {
            var messageConnection =
                await _messageConnectionWriteRepository.GetByIdAsync(_userAccessor.User.Id, cancellationToken) ??
                throw new MessageConnectionNotFoundException();

            messageConnection.ChangeState(request.State, request.TypingId);

            await _unitOfWork.CommitAsync(cancellationToken);
        }
    }
}
