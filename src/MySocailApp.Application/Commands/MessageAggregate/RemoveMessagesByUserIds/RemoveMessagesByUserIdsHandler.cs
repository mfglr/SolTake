using MediatR;
using MySocailApp.Application.InfrastructureServices;
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
            var accountId = _accessTokenReader.GetRequiredAccountId();
            var messages = await _messageWriteRepository.GetMessagesWithRemoverByUserIds(request.UserIds, accountId, cancellationToken);

            foreach (var message in messages)
                await _messageRemover.RemoveAsync(message, accountId, cancellationToken);

            await _unitOfWork.CommitAsync(cancellationToken);
        }
    }
}
