using MediatR;
using MySocailApp.Application.InfrastructureServices;
using SolTake.Domain.QuestionAggregate.Abstracts;
using SolTake.Domain.SolutionAggregate.Abstracts;
using SolTake.Domain.SolutionAggregate.DomainEvents;
using SolTake.Domain.SolutionAggregate.Entities;
using SolTake.Domain.UserUserBlockAggregate.DomainEvents;
using SolTake.Core;

namespace MySocailApp.Application.DomainEventConsumers.UserUserBlockCreatedDomainEventConsumers.SolutionAggregate
{
    public class DeleteSolutions(ISolutionWriteRepository solutionWriteRepository, IUnitOfWork unitOfWork, IQuestionReadRepository questionReadRepository, IPublisher publisher) : IDomainEventConsumer<UserUserBlockCreatedDomainEvent>
    {
        private readonly IQuestionReadRepository _questionReadRepository = questionReadRepository;
        private readonly ISolutionWriteRepository _solutionWriteRepository = solutionWriteRepository;
        private readonly IUnitOfWork _unitOfWork = unitOfWork;
        private readonly IPublisher _publisher = publisher;

        public async Task Handle(UserUserBlockCreatedDomainEvent notification, CancellationToken cancellationToken)
        {
            var questionIdsOfBlocker = await _questionReadRepository.GetQuestionIdsOfUser(notification.UserUserBlock.BlockerId, cancellationToken);
            var solutions0 = await _solutionWriteRepository.GetAsync(questionIdsOfBlocker, notification.UserUserBlock.BlockedId, cancellationToken);
            _solutionWriteRepository.DeleteRange(solutions0);

            var questionIdsOfBlocked = await _questionReadRepository.GetQuestionIdsOfUser(notification.UserUserBlock.BlockedId, cancellationToken);
            var solutions1 = await _solutionWriteRepository.GetAsync(questionIdsOfBlocked, notification.UserUserBlock.BlockerId, cancellationToken);
            _solutionWriteRepository.DeleteRange(solutions1);

            await _unitOfWork.CommitAsync(cancellationToken);

            List<Solution> solutions = [..solutions0, ..solutions1];
            foreach (var solution in solutions)
                await _publisher.Publish(new SolutionDeletedDomainEvent(solution), cancellationToken);

        }
    }
}
