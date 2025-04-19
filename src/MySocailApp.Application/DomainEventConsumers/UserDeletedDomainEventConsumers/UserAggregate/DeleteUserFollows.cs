using MySocailApp.Application.InfrastructureServices;
using MySocailApp.Core;
using MySocailApp.Domain.FollowAggregate.Abstracts;
using MySocailApp.Domain.UserAggregate.DomainEvents;

namespace MySocailApp.Application.DomainEventConsumers.UserDeletedDomainEventConsumers.UserAggregate
{
    public class DeleteUserFollows(IUnitOfWork unitOfWork, IFollowWriteRepository followWriteRepository) : IDomainEventConsumer<UserDeletedDomainEvent>
    {
        private readonly IUnitOfWork _unitOfWork = unitOfWork;
        private readonly IFollowWriteRepository _followWriteRepository = followWriteRepository;

        public async Task Handle(UserDeletedDomainEvent notification, CancellationToken cancellationToken)
        {
            var follows = await _followWriteRepository.GetByUserIdAsync(notification.User.Id,cancellationToken);
            _followWriteRepository.DeleteRange(follows);
            await _unitOfWork.CommitAsync(cancellationToken);
        }
    }
}
