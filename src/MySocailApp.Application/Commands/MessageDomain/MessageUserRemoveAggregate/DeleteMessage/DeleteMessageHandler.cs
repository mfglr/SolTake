using MediatR;
using MySocailApp.Application.InfrastructureServices;
using MySocailApp.Domain.MessageDomain.MessageAggregate.Abstracts;
using MySocailApp.Domain.MessageDomain.MessageAggregate.Exceptions;
using MySocailApp.Domain.MessageDomain.MessageUserRemoveAggregate.Abstracts;
using MySocailApp.Domain.MessageDomain.MessageUserRemoveAggregate.Entities;

namespace MySocailApp.Application.Commands.MessageDomain.MessageUserRemoveAggregate.DeleteMessage
{
    public class DeleteMessageHandler(IUnitOfWork unitOfWork, IMessageUserRemoveWriteRepository messageUserRemoveWriteRepository, IMessageUserRemoveReadRepository messageUserRemoveReadRepository, IUserAccessor userAccessor, IMessageReadRepository messageReadRepository) : IRequestHandler<DeleteMessageDto>
    {
        private readonly IUnitOfWork _unitOfWork = unitOfWork;
        private readonly IUserAccessor _userAccessor = userAccessor;
        private readonly IMessageReadRepository _messageReadRepository = messageReadRepository;
        private readonly IMessageUserRemoveWriteRepository _messageUserRemoveWriteRepository = messageUserRemoveWriteRepository;
        private readonly IMessageUserRemoveReadRepository _messageUserRemoveReadRepository = messageUserRemoveReadRepository;

        public async Task Handle(DeleteMessageDto request, CancellationToken cancellationToken)
        {
            var message =
                await _messageReadRepository.GetByIdAsync(request.MessageId, cancellationToken) ??
                throw new MessageNotFoundException();

            if (!message.UserIds.Any(x => x == _userAccessor.User.Id))
                throw new PermissionDeniedToRemoveMessageException();

            var userIdsRemoved = await _messageUserRemoveReadRepository.GetUserIdsRemovedAsync(request.MessageId, cancellationToken);

            if (request.All)
            {
                var userIdsNotRemoved = message.UserIds.Where(x => !userIdsRemoved.Any(uir => uir != x));

                foreach (var userId in userIdsNotRemoved)
                {
                    var messageUserRemove = MessageUserRemove.Create(request.MessageId, userId);
                    await _messageUserRemoveWriteRepository.CreateAsync(messageUserRemove, cancellationToken);
                }
            }
            else
            {
                if (userIdsRemoved.Any(x => x == _userAccessor.User.Id))
                    throw new MessageAlreadyDeletedException();

                var messageUserRemove = MessageUserRemove.Create(request.MessageId, _userAccessor.User.Id);
                await _messageUserRemoveWriteRepository.CreateAsync(messageUserRemove, cancellationToken);
            }
            await _unitOfWork.CommitAsync(cancellationToken);
        }
    }
}
