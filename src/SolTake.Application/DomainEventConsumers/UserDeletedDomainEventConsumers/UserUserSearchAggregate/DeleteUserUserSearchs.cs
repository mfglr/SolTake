using MySocailApp.Application.InfrastructureServices;
using SolTake.Domain.UserAggregate.DomainEvents;
using MySocailApp.Domain.UserUserSearchAggregate.Abstracts;
using SolTake.Core;

namespace MySocailApp.Application.DomainEventConsumers.UserDeletedDomainEventConsumers.UserUserSearchAggregate
{
    public class DeleteUserUserSearchs(IUnitOfWork unitOfWork, IUserUserSearchWriteRepository userSearchWriteRepository) : IDomainEventConsumer<UserDeletedDomainEvent>
    {
        private readonly IUnitOfWork _unitOfWork = unitOfWork;
        private readonly IUserUserSearchWriteRepository _userSearchWriteRepository = userSearchWriteRepository;

        public async Task Handle(UserDeletedDomainEvent notification, CancellationToken cancellationToken)
        {
            var searchs = await _userSearchWriteRepository.GetUserSearchsByUserId(notification.User.Id, cancellationToken);
            _userSearchWriteRepository.DeleteRange(searchs);
            await _unitOfWork.CommitAsync(cancellationToken);
        }
    }
}
