using MediatR;
using MySocailApp.Application.InfrastructureServices;
using MySocailApp.Domain.MessageDomain.MessageAggregate.Abstracts;
using MySocailApp.Domain.MessageDomain.MessageAggregate.Exceptions;

namespace MySocailApp.Application.Commands.MessageDomain.MessageAggregate.AddReceiverToMessage
{
    public class AddReceiverToMessageHandler(IMessageWriteRepository messageRepository, IUnitOfWork unitOfWork, IAccessTokenReader tokenReader) : IRequestHandler<AddReceiverToMessageDto>
    {
        private readonly IMessageWriteRepository _messageRepository = messageRepository;
        private readonly IUnitOfWork _unitOfWork = unitOfWork;
        private readonly IAccessTokenReader _tokenReader = tokenReader;

        public async Task Handle(AddReceiverToMessageDto request, CancellationToken cancellationToken)
        {
            var receiverId = _tokenReader.GetRequiredAccountId();
            var message =
                await _messageRepository.GetById(request.MessageId, cancellationToken) ??
                throw new MessageNotFoundException();

            //message.MarkAsReceived(receiverId);

            await _unitOfWork.CommitAsync(cancellationToken);
        }
    }
}
