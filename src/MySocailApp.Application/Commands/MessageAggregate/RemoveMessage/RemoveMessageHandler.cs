using MediatR;
using MySocailApp.Application.ApplicationServices;
using MySocailApp.Domain.MessageAggregate.DomainServices;
using MySocailApp.Domain.MessageAggregate.Exceptions;
using MySocailApp.Domain.MessageAggregate.Interfaces;

namespace MySocailApp.Application.Commands.MessageAggregate.RemoveMessage
{
    public class RemoveMessageHandler(IAccessTokenReader accessTokenReader, IMessageWriteRepository messageWriteRepository, IUnitOfWork unitOfWork, MessageRemoverDomainService messageRemover) : IRequestHandler<RemoveMessageDto>
    {
        private readonly IAccessTokenReader _accessTokenReader = accessTokenReader;
        private readonly IMessageWriteRepository _messageWriteRepository = messageWriteRepository;
        private readonly MessageRemoverDomainService _messageRemover = messageRemover;
        private readonly IUnitOfWork _unitOfWork = unitOfWork;

        public async Task Handle(RemoveMessageDto request, CancellationToken cancellationToken)
        {
            var message =
                await _messageWriteRepository.GetMesssageWithRemovers(request.MessageId, cancellationToken) ??
                throw new MessageNotFoundException();
            
            var removerId = _accessTokenReader.GetRequiredAccountId();
            await _messageRemover.RemoveAsync(message, removerId);

            await _unitOfWork.CommitAsync(cancellationToken);
        }
    }
}
