using MediatR;
using MySocailApp.Application.InfrastructureServices;
using MySocailApp.Domain.MessageDomain.MessageAggregate.Abstracts;
using MySocailApp.Domain.MessageDomain.MessageUserRemoveAggregate.Abstracts;
using MySocailApp.Domain.MessageDomain.MessageUserRemoveAggregate.Entities;

namespace MySocailApp.Application.Commands.MessageDomain.MessageUserRemoveAggregate.RemoveMessagesByUserIds
{
    public class RemoveMessagesByUserIdsHandler(IUnitOfWork unitOfWork, IAccessTokenReader accessTokenReader, IMessageReadRepository messageReadRepository, IMessageUserRemoveWriteRepository messageUserRemoveRepository) : IRequestHandler<RemoveMessagesByUserIdsDto>
    {
        private readonly IUnitOfWork _unitOfWork = unitOfWork;
        private readonly IAccessTokenReader _accessTokenReader = accessTokenReader;
        private readonly IMessageReadRepository _messageReadRepository = messageReadRepository;
        private readonly IMessageUserRemoveWriteRepository _messageUserRemoveRepository = messageUserRemoveRepository;

        public async Task Handle(RemoveMessagesByUserIdsDto request, CancellationToken cancellationToken)
        {
            var userId = _accessTokenReader.GetRequiredAccountId();
            var messageIds = await _messageReadRepository.GetMessageIdsByUserIds(request.UserIds, userId, cancellationToken);

            var messageUserRemoves = messageIds.Select(messageId => MessageUserRemove.Create(messageId, userId));
            await _messageUserRemoveRepository.CreateRangeAsync(messageUserRemoves,cancellationToken);

            await _unitOfWork.CommitAsync(cancellationToken);
        }
    }
}
