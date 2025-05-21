using MySocailApp.Application.InfrastructureServices;
using SolTake.Domain.UserUserConversationAggregate.Abstracts;
using SolTake.Domain.UserUserFollowAggregate.DomainEvents;
using SolTake.Core;

namespace MySocailApp.Application.DomainEventConsumers.UserUserFollowDeletedDomainEventConsumers.UserUserConversationAggregate
{
    public class DeleteUserUserConversation(IUserUserConversationWriteRepository userUserConversationWriteRepository, IUnitOfWork unitOfWork) : IDomainEventConsumer<UserUserFollowDeletedDomainEvent>
    {
        private readonly IUserUserConversationWriteRepository _userUserConversationWriteRepository = userUserConversationWriteRepository;
        private readonly IUnitOfWork _unitOfWork = unitOfWork;

        public async Task Handle(UserUserFollowDeletedDomainEvent notification, CancellationToken cancellationToken)
        {
            var userUserConversation = await _userUserConversationWriteRepository.GetAsync(notification.UserUserFollow.FollowerId, notification.UserUserFollow.FollowedId, cancellationToken);
            if (userUserConversation != null)
            {
                _userUserConversationWriteRepository.Delete(userUserConversation);
                await _unitOfWork.CommitAsync(cancellationToken);
            }

        }
    }
}
