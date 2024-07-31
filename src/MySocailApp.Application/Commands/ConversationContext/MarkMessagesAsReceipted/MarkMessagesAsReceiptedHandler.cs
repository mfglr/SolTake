using AutoMapper;
using MediatR;
using MySocailApp.Application.ApplicationServices;
using MySocailApp.Domain.ConversationContext.MessageAggregate.Interfaces;

namespace MySocailApp.Application.Commands.ConversationContext.MarkMessagesAsReceipted
{
    public class MarkMessagesAsReceiptedHandler(IMessageWriteRepository repository, IAccessTokenReader accessTokenReader,IUnitOfWork unitOfWork) : IRequestHandler<MarkMessagesAsReceiptedDto>
    {
        private readonly IMessageWriteRepository _repository = repository;
        private readonly IAccessTokenReader _accessTokenReader = accessTokenReader;
        private readonly IUnitOfWork _unitOfWork = unitOfWork;

        public async Task Handle(MarkMessagesAsReceiptedDto request, CancellationToken cancellationToken)
        {
            var recipientId = _accessTokenReader.GetRequiredAccountId();
            var messages = await _repository.GetByIds(request.Ids, cancellationToken);
            foreach (var message in messages)
                message.MarkAsReceipted(recipientId);
            await _unitOfWork.CommitAsync(cancellationToken);
        }
    }
}
