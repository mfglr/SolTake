using MediatR;
using MySocailApp.Application.InfrastructureServices;
using MySocailApp.Domain.MessageDomain.MessageAggregate.Abstracts;
using MySocailApp.Domain.MessageDomain.MessageAggregate.Exceptions;
using MySocailApp.Domain.MessageDomain.MessageUserRemoveAggregate.Abstracts;
using MySocailApp.Domain.MessageDomain.MessageUserRemoveAggregate.Entities;
using MySocailApp.Domain.MessageDomain.MessageUserRemoveAggregate.Exceptions;

namespace MySocailApp.Application.Commands.MessageDomain.MessageUserRemoveAggregate.Create
{
    public class CreateMessageUserRemoveHandler(IUnitOfWork unitOfWork, IMessageUserRemoveWriteRepository messageUserRemoveWriteRepository, IMessageUserRemoveReadRepository messageUserRemoveReadRepository, IUserAccessor userAccessor, IMessageReadRepository messageReadRepository) : IRequestHandler<CreateMessageUserRemoveDto>
    {
        private readonly IUnitOfWork _unitOfWork = unitOfWork;
        private readonly IUserAccessor _userAccessor = userAccessor;
        private readonly IMessageReadRepository _messageReadRepository = messageReadRepository;
        private readonly IMessageUserRemoveWriteRepository _messageUserRemoveWriteRepository = messageUserRemoveWriteRepository;
        private readonly IMessageUserRemoveReadRepository _messageUserRemoveReadRepository = messageUserRemoveReadRepository;

        public async Task Handle(CreateMessageUserRemoveDto request, CancellationToken cancellationToken)
        {
            var message =
                await _messageReadRepository.GetByIdAsync(request.MessageId, cancellationToken) ??
                throw new MessageNotFoundException();

            if (!message.UserIds.Any(x => x == _userAccessor.User.Id))
                throw new PermissionDeniedToRemoveMessageException();

            if (request.Everyone && message.SenderId != _userAccessor.User.Id)
                throw new PermissionDeniedToRemoveMessageFromEveryoneException();

            if (request.Everyone)
            {
                var userIdsRemoved = await _messageUserRemoveReadRepository.GetUserIdsRemovedAsync(request.MessageId, cancellationToken);
                var userIdsNotRemoved = message.UserIds.Where(x => !userIdsRemoved.Any(uir => uir != x));

                foreach (var userId in userIdsNotRemoved)
                {
                    var messageUserRemove = MessageUserRemove.Create(request.MessageId, userId);
                    await _messageUserRemoveWriteRepository.CreateAsync(messageUserRemove, cancellationToken);
                }
            }
            else
            {
                if (await _messageUserRemoveReadRepository.ExistAsync(request.MessageId, _userAccessor.User.Id,cancellationToken))
                    throw new MessageAlreadyDeletedException();

                var messageUserRemove = MessageUserRemove.Create(request.MessageId, _userAccessor.User.Id);
                await _messageUserRemoveWriteRepository.CreateAsync(messageUserRemove, cancellationToken);
            }
            await _unitOfWork.CommitAsync(cancellationToken);
        }
    }
}
