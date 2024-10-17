using MediatR;
using MySocailApp.Application.ApplicationServices;
using MySocailApp.Core;
using MySocailApp.Domain.QuestionAggregate.DomainEvents;
using MySocailApp.Domain.QuestionAggregate.Interfaces;
using MySocailApp.Domain.SolutionAggregate.DomainEvents;

namespace MySocailApp.Application.DomainEventConsumers.SolutionAggregate.SolutionMarkedAsCorrectDomainEventConsumers
{
    public class MarkQuestionAsSolved(IQuestionWriteRepository questionWriteRepository, IUnitOfWork unitOfWork, IPublisher publisher) : IDomainEventConsumer<SolutionMarkedAsCorrectDomainEvent>
    {
        private readonly IQuestionWriteRepository _questionWriteRepository = questionWriteRepository;
        private readonly IUnitOfWork _unitOfWork = unitOfWork;
        private readonly IPublisher _publisher = publisher;

        public async Task Handle(SolutionMarkedAsCorrectDomainEvent notification, CancellationToken cancellationToken)
        {
            var question = await _questionWriteRepository.GetByIdAsync(notification.Solution.QuestionId, cancellationToken);
            if (question == null) return;
            question.MarkAsSolved();
            await _unitOfWork.CommitAsync(cancellationToken);
            
            await _publisher.Publish(new QuestionMarkedAsSolvedDomainEvent(question,notification.Solution));
        }
    }
}
