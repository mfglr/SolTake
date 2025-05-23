using MediatR;
using SolTake.Application.InfrastructureServices;
using SolTake.Domain.QuestionAggregate.Abstracts;
using SolTake.Domain.QuestionAggregate.DomainEvents;
using SolTake.Domain.UserAggregate.DomainEvents;
using SolTake.Core;

namespace SolTake.Application.DomainEventConsumers.UserDeletedDomainEventConsumers.QuestionAggregate
{
    public class DeleteUserQuestions(IQuestionWriteRepository questionWriteRepository, IUnitOfWork unitOfWork, IPublisher publisher) : IDomainEventConsumer<UserDeletedDomainEvent>
    {
        private readonly IQuestionWriteRepository _questionWriteRepository = questionWriteRepository;
        private readonly IUnitOfWork _unitOfWork = unitOfWork;
        private readonly IPublisher _publisher = publisher;

        public async Task Handle(UserDeletedDomainEvent notification, CancellationToken cancellationToken)
        {
            var questions = await _questionWriteRepository.GetUserQuestionsAsync(notification.User.Id, cancellationToken);
            _questionWriteRepository.DeleteRange(questions);
            await _unitOfWork.CommitAsync(cancellationToken);

            foreach (var question in questions)
                await _publisher.Publish(new QuestionDeletedDomainEvent(question));

        }
    }
}
