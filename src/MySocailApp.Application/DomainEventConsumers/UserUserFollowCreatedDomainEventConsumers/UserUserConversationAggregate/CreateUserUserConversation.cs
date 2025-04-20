using MySocailApp.Application.InfrastructureServices;
using MySocailApp.Core;
using MySocailApp.Domain.UserUserConversationAggregate.Abstracts;
using MySocailApp.Domain.UserUserConversationAggregate.DomainServices;
using MySocailApp.Domain.UserUserConversationAggregate.Entities;
using MySocailApp.Domain.UserUserFollowAggregate.DomainEvents;

namespace MySocailApp.Application.DomainEventConsumers.UserUserFollowCreatedDomainEventConsumers.UserUserConversationAggregate
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
