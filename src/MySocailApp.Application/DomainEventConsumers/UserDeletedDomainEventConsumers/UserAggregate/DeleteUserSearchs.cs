using MySocailApp.Application.InfrastructureServices;
using MySocailApp.Core;
using MySocailApp.Domain.UserAggregate.Abstracts;
using MySocailApp.Domain.UserAggregate.DomainEvents;

namespace MySocailApp.Application.DomainEventConsumers.UserDeletedDomainEventConsumers.UserAggregate
{
    public class DeleteUserSearchs(IUnitOfWork unitOfWork, IUserWriteRepository userWriteRepository) : IDomainEventConsumer<UserDeletedDomainEvent>
    {
        private readonly IUnitOfWork _unitOfWork = unitOfWork;
        private readonly IUserWriteRepository _userWriteRepository = userWriteRepository;

        public async Task Handle(UserDeletedDomainEvent notification, CancellationToken cancellationToken)
        {
            await _userWriteRepository.DeleteUserSerchsByUserId(notification.User.Id, cancellationToken);
            await _unitOfWork.CommitAsync(cancellationToken);
        }
    }
}
