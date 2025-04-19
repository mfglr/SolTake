using MediatR;
using MySocailApp.Application.InfrastructureServices;
using MySocailApp.Core;
using MySocailApp.Domain.SolutionDomain.SolutionAggregate.Abstracts;
using MySocailApp.Domain.SolutionDomain.SolutionAggregate.DomainEvents;
using MySocailApp.Domain.UserAggregate.DomainEvents;

namespace MySocailApp.Application.DomainEventConsumers.UserDeletedDomainEventConsumers.SolutionAggregate
{
    public class DeleteUserSolutions(ISolutionWriteRepository solutionWriteRepository, IUnitOfWork unitOfWork, IPublisher publisher) : IDomainEventConsumer<UserDeletedDomainEvent>
    {
        private readonly ISolutionWriteRepository _solutionWriteRepository = solutionWriteRepository;
        private readonly IUnitOfWork _unitOfWork = unitOfWork;
        private readonly IPublisher _publisher = publisher;

        public async Task Handle(UserDeletedDomainEvent notification, CancellationToken cancellationToken)
        {
            var solutions = await _solutionWriteRepository.GetUserSolutionsAsync(notification.User.Id, cancellationToken);
            _solutionWriteRepository.DeleteRange(solutions);
            await _unitOfWork.CommitAsync(cancellationToken);

            foreach (var solution in solutions)
                await _publisher.Publish(new SolutionDeletedDomainEvent(solution));
        }
    }
}
