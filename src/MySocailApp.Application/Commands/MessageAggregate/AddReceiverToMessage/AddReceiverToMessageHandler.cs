using MediatR;
using MySocailApp.Application.ApplicationServices;
using MySocailApp.Domain.MessageAggregate.DomainServices;
using MySocailApp.Domain.MessageAggregate.Exceptions;
using MySocailApp.Domain.MessageAggregate.Interfaces;
using MySocailApp.Domain.Shared;

namespace MySocailApp.Application.Commands.MessageAggregate.AddReceiverToMessage
{
    public class AddReceiverToMessageHandler(IMessageWriteRepository messageRepository, IUnitOfWork unitOfWork, IAccessTokenReader tokenReader, MessageStateUpdaterDomainService stateUpdater) : IRequestHandler<AddReceiverToMessageDto>
    {
        private readonly IMessageWriteRepository _messageRepository = messageRepository;
        private readonly IUnitOfWork _unitOfWork = unitOfWork;
        private readonly MessageStateUpdaterDomainService _stateUpdater = stateUpdater;
        private readonly IAccessTokenReader _tokenReader = tokenReader;

        public async Task Handle(AddReceiverToMessageDto request, CancellationToken cancellationToken)
        {
            var receiverId = _tokenReader.GetRequiredAccountId();
            var message =
                await _messageRepository.GetById(request.MessageId, cancellationToken) ??
                throw new MessageNotFoundException();
            await _stateUpdater.AddReceiverAsync(message, receiverId, cancellationToken);

            await _unitOfWork.CommitAsync(cancellationToken);
        }
    }
}
