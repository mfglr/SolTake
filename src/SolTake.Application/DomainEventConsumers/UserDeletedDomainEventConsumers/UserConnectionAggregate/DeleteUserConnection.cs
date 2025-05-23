using SolTake.Application.InfrastructureServices;
using SolTake.Domain.UserAggregate.DomainEvents;
using SolTake.Core;
using SolTake.Domain.MessageConnectionAggregate.Abstracts;

namespace SolTake.Application.DomainEventConsumers.UserDeletedDomainEventConsumers.UserConnectionAggregate
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
