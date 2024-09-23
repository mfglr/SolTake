using MySocailApp.Application.ApplicationServices;
using MySocailApp.Core;
using MySocailApp.Domain.SolutionAggregate.DomainEvents;
using MySocailApp.Domain.SolutionAggregate.DomainServices;

namespace MySocailApp.Application.DomainEventConsumers.SolutionDeletedDomainEventConsumers
{
    public class DeleteSolution(SolutionDeleterDomainService solutionDeleter, IUnitOfWork unitOfWork) : IDomainEventConsumer<SolutionDeletedDomainEvent>
    {
        private readonly SolutionDeleterDomainService _solutionDeleter = solutionDeleter;
        private readonly IUnitOfWork _unitOfWork = unitOfWork;

        public async Task Handle(SolutionDeletedDomainEvent notification, CancellationToken cancellationToken)
        {
            await _solutionDeleter.DeleteAsync(notification.SolutionId, cancellationToken);
            await _unitOfWork.CommitAsync(cancellationToken);
        }
    }
}
