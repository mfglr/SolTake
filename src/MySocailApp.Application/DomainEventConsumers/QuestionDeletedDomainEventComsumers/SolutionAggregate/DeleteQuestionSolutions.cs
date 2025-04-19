using MediatR;
using MySocailApp.Application.InfrastructureServices;
using MySocailApp.Core;
using MySocailApp.Domain.QuestionAggregate.DomainEvents;
using MySocailApp.Domain.SolutionDomain.SolutionAggregate.Abstracts;
using MySocailApp.Domain.SolutionDomain.SolutionAggregate.DomainEvents;

namespace MySocailApp.Application.DomainEventConsumers.QuestionDeletedDomainEventComsumers.SolutionAggregate
{
    public class DeleteQuestionSolutions(ISolutionWriteRepository solutionWriteRepository, IUnitOfWork unitOfWork, IPublisher publisher) : IDomainEventConsumer<QuestionDeletedDomainEvent>
    {
        private readonly ISolutionWriteRepository _solutionWriteRepository = solutionWriteRepository;
        private readonly IUnitOfWork _unitOfWork = unitOfWork;
        private readonly IPublisher _publisher = publisher;

        public async Task Handle(QuestionDeletedDomainEvent notification, CancellationToken cancellationToken)
        {
            var solutions = await _solutionWriteRepository.GetQuestionSolutionsAsync(notification.Question.Id, cancellationToken);
            _solutionWriteRepository.DeleteRange(solutions);
            await _unitOfWork.CommitAsync(cancellationToken);

            foreach (var solution in solutions)
                await _publisher.Publish(new SolutionDeletedDomainEvent(solution));
        }
    }
}
