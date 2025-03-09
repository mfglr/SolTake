using MySocailApp.Application.InfrastructureServices;
using MySocailApp.Core;
using MySocailApp.Domain.SolutionDomain.SolutionUserSaveAggregate.Abstracts;
using MySocailApp.Domain.UserDomain.UserAggregate.DomainEvents;

namespace MySocailApp.Application.DomainEventConsumers.UserDeletedDomainEventConsumers.SolutionUserSaveAggregate
{
    public class DeleteSolutionUserSaves(IUnitOfWork unitOfWork, ISolutionUserSaveWriteRepository solutionUserSaveWriteRepository) : IDomainEventConsumer<UserDeletedDomainEvent>
    {
        private readonly IUnitOfWork _unitOfWork = unitOfWork;
        private readonly ISolutionUserSaveWriteRepository _solutionUserSaveWriteRepository = solutionUserSaveWriteRepository;

        public async Task Handle(UserDeletedDomainEvent notification, CancellationToken cancellationToken)
        {
            var saves = await _solutionUserSaveWriteRepository.GetByUserId(notification.User.Id, cancellationToken);
            _solutionUserSaveWriteRepository.DeleteRange(saves);
            await _unitOfWork.CommitAsync(cancellationToken);
        }
    }
}
