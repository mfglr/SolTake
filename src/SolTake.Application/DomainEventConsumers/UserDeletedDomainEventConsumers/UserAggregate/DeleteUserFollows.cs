using MySocailApp.Application.InfrastructureServices;
using SolTake.Domain.UserAggregate.DomainEvents;
using SolTake.Domain.UserUserFollowAggregate.Abstracts;
using SolTake.Core;

namespace MySocailApp.Application.DomainEventConsumers.UserDeletedDomainEventConsumers.UserAggregate
{
    public class DeleteUserFollows(IUnitOfWork unitOfWork, IUserUserFollowWriteRepository followWriteRepository) : IDomainEventConsumer<UserDeletedDomainEvent>
    {
        private readonly IUnitOfWork _unitOfWork = unitOfWork;
        private readonly IUserUserFollowWriteRepository _followWriteRepository = followWriteRepository;

        public async Task Handle(UserDeletedDomainEvent notification, CancellationToken cancellationToken)
        {
            var follows = await _followWriteRepository.GetByUserIdAsync(notification.User.Id,cancellationToken);
            _followWriteRepository.DeleteRange(follows);
            await _unitOfWork.CommitAsync(cancellationToken);
        }
    }
}
