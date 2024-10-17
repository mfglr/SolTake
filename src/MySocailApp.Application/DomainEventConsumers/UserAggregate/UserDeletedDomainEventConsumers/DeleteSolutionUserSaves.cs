using MySocailApp.Application.ApplicationServices;
using MySocailApp.Core;
using MySocailApp.Domain.AppUserAggregate.DomainEvents;
using MySocailApp.Domain.SolutionAggregate.Interfaces;

namespace MySocailApp.Application.DomainEventConsumers.UserAggregate.UserDeletedDomainEventConsumers
{
    public class DeleteSolutionUserSaves(ISolutionWriteRepository solutionWriteRepository, IUnitOfWork unitOfWork) : IDomainEventConsumer<UserDeletedDomainEvent>
    {
        private readonly ISolutionWriteRepository _solutionWriteRepository = solutionWriteRepository;
        private readonly IUnitOfWork _unitOfWork = unitOfWork;

        public async Task Handle(UserDeletedDomainEvent notification, CancellationToken cancellationToken)
        {
            var solutions = await _solutionWriteRepository.GetSolutionsSavedByUserId(notification.User.Id, cancellationToken);
            foreach (var solution in solutions)
                solution.Unsave(notification.User.Id);
            await _unitOfWork.CommitAsync(cancellationToken);
        }
    }
}
