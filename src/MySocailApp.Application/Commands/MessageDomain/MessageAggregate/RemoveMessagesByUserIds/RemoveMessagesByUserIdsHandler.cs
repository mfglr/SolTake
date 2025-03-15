using MediatR;
using MySocailApp.Application.InfrastructureServices;
using MySocailApp.Domain.MessageDomain.MessageAggregate.Abstracts;

namespace MySocailApp.Application.Commands.MessageDomain.MessageAggregate.RemoveMessagesByUserIds
{
    public class RemoveMessagesByUserIdsHandler(IMessageWriteRepository messageWriteRepository, IUnitOfWork unitOfWork, IAccessTokenReader accessTokenReader) : IRequestHandler<RemoveMessagesByUserIdsDto>
    {
        private readonly IMessageWriteRepository _messageWriteRepository = messageWriteRepository;
        private readonly IUnitOfWork _unitOfWork = unitOfWork;
        private readonly IAccessTokenReader _accessTokenReader = accessTokenReader;

        public async Task Handle(RemoveMessagesByUserIdsDto request, CancellationToken cancellationToken)
        {
            var accountId = _accessTokenReader.GetRequiredAccountId();
            var messages = await _messageWriteRepository.GetMessagesWithRemoverByUserIds(request.UserIds, accountId, cancellationToken);

            //foreach (var message in messages)
            //    await _messageRemover.RemoveAsync(message, accountId, cancellationToken);

            await _unitOfWork.CommitAsync(cancellationToken);
        }
    }
}
