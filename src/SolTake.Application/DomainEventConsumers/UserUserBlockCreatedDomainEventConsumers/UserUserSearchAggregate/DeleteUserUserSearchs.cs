using MySocailApp.Application.InfrastructureServices;
using MySocailApp.Domain.UserUserBlockAggregate.DomainEvents;
using MySocailApp.Domain.UserUserSearchAggregate.Abstracts;
using SolTake.Core;

namespace MySocailApp.Application.DomainEventConsumers.UserUserBlockCreatedDomainEventConsumers.UserUserSearchAggregate
{
    public class DeleteUserUserSearchs(IUserUserSearchWriteRepository userUserSearchWriteRepository, IUnitOfWork unitOfWork) : IDomainEventConsumer<UserUserBlockCreatedDomainEvent>
    {
        private readonly IUserUserSearchWriteRepository _userUserSearchWriteRepository = userUserSearchWriteRepository;
        private readonly IUnitOfWork _unitOfWork = unitOfWork;

        public async Task Handle(UserUserBlockCreatedDomainEvent notification, CancellationToken cancellationToken)
        {
            var userUserSearchs = await _userUserSearchWriteRepository.GetByUserIds(notification.UserUserBlock.BlockerId,notification.UserUserBlock.BlockedId,cancellationToken);
            _userUserSearchWriteRepository.DeleteRange(userUserSearchs);
            await _unitOfWork.CommitAsync(cancellationToken);
        }
    }
}
