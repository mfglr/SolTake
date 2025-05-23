using MediatR;
using SolTake.Application.InfrastructureServices;
using SolTake.Domain.MessageUserRemoveAggregate.Exceptions;
using SolTake.Domain.MessageAggregate.Abstracts;
using SolTake.Domain.MessageUserRemoveAggregate.Abstracts;
using SolTake.Domain.MessageUserRemoveAggregate.Entities;

namespace SolTake.Application.Commands.MessageDomain.MessageUserRemoveAggregate.RemoveMessages
{
    public class RemoveMessagesHandler(IUnitOfWork unitOfWork, IMessageUserRemoveWriteRepository messageUserRemoveWriteRepository, IMessageUserRemoveReadRepository messageUserRemoveReadRepository, IMessageReadRepository messageReadRepository, IAccessTokenReader accessTokenReader) : IRequestHandler<RemoveMessagesDto>
    {
        private readonly IUnitOfWork _unitOfWork = unitOfWork;
        private readonly IAccessTokenReader _accessTokenReader = accessTokenReader;
        private readonly IMessageReadRepository _messageReadRepository = messageReadRepository;
        private readonly IMessageUserRemoveWriteRepository _messageUserRemoveWriteRepository = messageUserRemoveWriteRepository;
        private readonly IMessageUserRemoveReadRepository _messageUserRemoveReadRepository = messageUserRemoveReadRepository;

        public async Task Handle(RemoveMessagesDto request, CancellationToken cancellationToken)
        {
            var userId = _accessTokenReader.GetRequiredAccountId();

            if (request.Everyone)
            {
                if (await _messageReadRepository.IsNotValidToRemoveForEveryone(request.MessageIds, userId, cancellationToken))
                    throw new PermissionDeniedToRemoveMessageFromEveryoneException();

                foreach(var messageId in request.MessageIds)
                {
                    var userIds = await _messageReadRepository.GetMessageUserIds(messageId, cancellationToken);
                    if (userIds == null) break;

                    var userIdsRemoved = await _messageUserRemoveReadRepository.GetUserIdsRemovedAsync(messageId, cancellationToken);
                    var userIdsNotRemoved = userIds.Except(userIdsRemoved);
                    var messageUserRemoves = userIdsNotRemoved.Select(userId => MessageUserRemove.Create(messageId, userId));
                    await _messageUserRemoveWriteRepository.CreateRangeAsync(messageUserRemoves, cancellationToken);
                }
            }
            else
            {
                if (await _messageReadRepository.IsNotValidToRemove(request.MessageIds, userId, cancellationToken))
                    throw new PermissionDeniedToRemoveMessageException();

                foreach (var messageId in request.MessageIds)
                {
                    if (await _messageUserRemoveReadRepository.ExistAsync(messageId, userId, cancellationToken)) break;

                    var messageUserRemove = MessageUserRemove.Create(messageId, userId);
                    await _messageUserRemoveWriteRepository.CreateAsync(messageUserRemove, cancellationToken);
                }
            }
            await _unitOfWork.CommitAsync(cancellationToken);
        }
    }
}
