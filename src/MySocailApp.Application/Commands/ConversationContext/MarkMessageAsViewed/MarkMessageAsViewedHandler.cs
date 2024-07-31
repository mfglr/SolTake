using MediatR;
using MySocailApp.Application.ApplicationServices;
using MySocailApp.Domain.ConversationContext.MessageAggregate.Exceptions;
using MySocailApp.Domain.ConversationContext.MessageAggregate.Interfaces;

namespace MySocailApp.Application.Commands.ConversationContext.MarkMessageAsViewed
{
    public class MarkMessageAsViewedHandler(IMessageWriteRepository repository, IUnitOfWork unitOfWork, IAccessTokenReader tokenReader) : IRequestHandler<MarkMessageAsViewedDto>
    {
        private readonly IMessageWriteRepository _repository = repository;
        private readonly IUnitOfWork _unitOfWork = unitOfWork;
        private readonly IAccessTokenReader _tokenReader = tokenReader;

        public async Task Handle(MarkMessageAsViewedDto request, CancellationToken cancellationToken)
        {
            var accountId = _tokenReader.GetRequiredAccountId();
            var message = 
                await _repository.GetById(request.MessageId, cancellationToken) ?? 
                throw new MessageNotFoundException();
            message.MarkAsViewed(accountId);
            await _unitOfWork.CommitAsync(cancellationToken);
        }
    }
}
