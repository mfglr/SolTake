using MediatR;
using MySocailApp.Application.ApplicationServices;
using MySocailApp.Domain.MessageAggregate.DomainServices;
using MySocailApp.Domain.MessageAggregate.Interfaces;

namespace MySocailApp.Application.Commands.MessageAggregate.RemoveMessagesByUserIds
{
    public class RemoveMessagesByUserIdsHandler(IMessageWriteRepository messageWriteRepository, IUnitOfWork unitOfWork, IAccessTokenReader accessTokenReader, MessageRemoverDomainService messageRemover) : IRequestHandler<RemoveMessagesByUserIdsDto>
    {
        private readonly IMessageWriteRepository _messageWriteRepository = messageWriteRepository;
        private readonly IUnitOfWork _unitOfWork = unitOfWork;
        private readonly IAccessTokenReader _accessTokenReader = accessTokenReader;
        private readonly MessageRemoverDomainService _messageRemover = messageRemover;

        public async Task Handle(RemoveMessagesByUserIdsDto request, CancellationToken cancellationToken)
        {
            var acccountId = _accessTokenReader.GetRequiredAccountId();
            var messages = await _messageWriteRepository.GetMessagesWithRemoverByUserIds(request.UserIds, acccountId, cancellationToken);

            foreach (var message in messages)
                _messageRemover.Remove(message, acccountId);

            await _unitOfWork.CommitAsync(cancellationToken);
        }
    }
}
