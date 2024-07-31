using MediatR;
using MySocailApp.Application.ApplicationServices;
using MySocailApp.Domain.ConversationContext.MessageAggregate.Exceptions;
using MySocailApp.Domain.ConversationContext.MessageAggregate.Interfaces;

namespace MySocailApp.Application.Commands.ConversationContext.MarkMessageAsReceipted
{
    public class MarkMessageAsReceiptedHandler(IMessageWriteRepository messageRepository, IUnitOfWork unitOfWork, IAccessTokenReader tokenReader) : IRequestHandler<MarkMessageAsReceiptedDto>
    {
        private readonly IMessageWriteRepository _messageRepository = messageRepository;
        private readonly IUnitOfWork _unitOfWork = unitOfWork;
        private readonly IAccessTokenReader _tokenReader = tokenReader;

        public async Task Handle(MarkMessageAsReceiptedDto request, CancellationToken cancellationToken)
        {
            var accountId = _tokenReader.GetRequiredAccountId();
            var message =
                await _messageRepository.GetById(request.MessageId, cancellationToken) ??
                throw new MessageNotFoundException();
           
            message.MarkAsReceipted(accountId);
            await _unitOfWork.CommitAsync(cancellationToken);
        }
    }
}
