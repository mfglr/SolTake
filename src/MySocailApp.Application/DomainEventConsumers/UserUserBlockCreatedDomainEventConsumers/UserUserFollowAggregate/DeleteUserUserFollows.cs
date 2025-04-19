using MySocailApp.Application.InfrastructureServices;
using MySocailApp.Core;
using MySocailApp.Domain.UserUserBlockAggregate.DomainEvents;
using MySocailApp.Domain.UserUserFollowAggregate.Abstracts;

namespace MySocailApp.Application.DomainEventConsumers.UserUserBlockCreatedDomainEventConsumers.UserUserFollowAggregate
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
