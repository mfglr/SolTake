using SolTake.Application.InfrastructureServices;
using SolTake.Domain.UserUserBlockAggregate.DomainEvents;
using SolTake.Domain.UserUserFollowAggregate.Abstracts;
using SolTake.Core;

namespace SolTake.Application.DomainEventConsumers.UserUserBlockCreatedDomainEventConsumers.UserUserFollowAggregate
{
    public class DeleteUserUserFollows(IUserUserFollowWriteRepository userUserFollowWriteRepository, IUnitOfWork unitOfWork) : IDomainEventConsumer<UserUserBlockCreatedDomainEvent>
    {
        private readonly IUserUserFollowWriteRepository _userUserFollowWriteRepository = userUserFollowWriteRepository;
        private readonly IUnitOfWork _unitOfWork = unitOfWork;

        public async Task Handle(UserUserBlockCreatedDomainEvent notification, CancellationToken cancellationToken)
        {
            var userUserFollows = await _userUserFollowWriteRepository.GetListAsync(notification.UserUserBlock.BlockerId,notification.UserUserBlock.BlockedId,cancellationToken);
            _userUserFollowWriteRepository.DeleteRange(userUserFollows);
            await _unitOfWork.CommitAsync(cancellationToken);
        }
    }
}
