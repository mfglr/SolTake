using MySocailApp.Application.InfrastructureServices;
using MySocailApp.Core;
using MySocailApp.Domain.MessageConnectionAggregate.Abstracts;
using MySocailApp.Domain.UserAggregate.DomainEvents;

namespace MySocailApp.Application.DomainEventConsumers.UserDeletedDomainEventConsumers.UserConnectionAggregate
{
    public class DeleteUserConnection(IMessageConnectionWriteRepository userConnectionWriteRepository, IUnitOfWork unitOfWork) : IDomainEventConsumer<UserDeletedDomainEvent>
    {
        private readonly IMessageConnectionWriteRepository _userConnectionWriteRepository = userConnectionWriteRepository;
        private readonly IUnitOfWork _unitOfWork = unitOfWork;

        public async Task Handle(UserDeletedDomainEvent notification, CancellationToken cancellationToken)
        {
            var connection = await _userConnectionWriteRepository.GetByIdAsync(notification.User.Id, cancellationToken);
            if (connection != null)
                _userConnectionWriteRepository.Delete(connection);
            await _unitOfWork.CommitAsync(cancellationToken);
        }
    }
}
