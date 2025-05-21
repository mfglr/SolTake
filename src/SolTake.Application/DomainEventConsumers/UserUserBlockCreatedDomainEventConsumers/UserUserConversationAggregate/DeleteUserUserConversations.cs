using MySocailApp.Application.InfrastructureServices;
using SolTake.Domain.UserUserBlockAggregate.DomainEvents;
using SolTake.Domain.UserUserConversationAggregate.Abstracts;
using SolTake.Core;

namespace MySocailApp.Application.DomainEventConsumers.UserUserBlockCreatedDomainEventConsumers.UserUserConversationAggregate
{
    public class DeleteUserUserConversations(IUserUserConversationWriteRepository userUserConversationWriteRepository, IUnitOfWork unitOfWork) : IDomainEventConsumer<UserUserBlockCreatedDomainEvent>
    {
        private readonly IUserUserConversationWriteRepository _userUserConversationWriteRepository = userUserConversationWriteRepository;
        private readonly IUnitOfWork _unitOfWork = unitOfWork;

        public async Task Handle(UserUserBlockCreatedDomainEvent notification, CancellationToken cancellationToken)
        {
            var userUserConversations = await _userUserConversationWriteRepository.GetListAsync(
                notification.UserUserBlock.BlockerId,
                notification.UserUserBlock.BlockedId,
                cancellationToken
            );
            _userUserConversationWriteRepository.DeleteRange(userUserConversations);
            await _unitOfWork.CommitAsync(cancellationToken);
        }
    }
}
