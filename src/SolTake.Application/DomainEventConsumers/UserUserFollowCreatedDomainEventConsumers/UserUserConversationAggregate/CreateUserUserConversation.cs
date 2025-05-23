using SolTake.Application.InfrastructureServices;
using SolTake.Domain.UserUserConversationAggregate.Abstracts;
using SolTake.Domain.UserUserConversationAggregate.DomainServices;
using SolTake.Domain.UserUserConversationAggregate.Entities;
using SolTake.Domain.UserUserFollowAggregate.DomainEvents;
using SolTake.Core;

namespace SolTake.Application.DomainEventConsumers.UserUserFollowCreatedDomainEventConsumers.UserUserConversationAggregate
{
    internal class CreateUserUserConversation(IUserUserConversationWriteRepository userUserConversationWriteRepository, IUnitOfWork unitOfWork, UserUserConversationCreatorDomainService userUserConversationCreatorDomainService) : IDomainEventConsumer<UserUserFollowCreatedDomainEvent>
    {
        private readonly IUserUserConversationWriteRepository _userUserConversationWriteRepository = userUserConversationWriteRepository;
        private readonly IUnitOfWork _unitOfWork = unitOfWork;
        private readonly UserUserConversationCreatorDomainService _userUserConversationCreatorDomainService = userUserConversationCreatorDomainService;

        public async Task Handle(UserUserFollowCreatedDomainEvent notification, CancellationToken cancellationToken)
        {
            var userUserConversation = new UserUserConversation(notification.Follow.FollowerId, notification.Follow.FollowedId);
            await _userUserConversationCreatorDomainService.CreateAsync(userUserConversation,cancellationToken);
            await _userUserConversationWriteRepository.CreateAsync(userUserConversation,cancellationToken);

            await _unitOfWork.CommitAsync(cancellationToken);
        }
    }
}
