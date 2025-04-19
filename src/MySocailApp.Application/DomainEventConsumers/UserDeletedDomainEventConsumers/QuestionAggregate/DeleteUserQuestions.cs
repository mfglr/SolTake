using MediatR;
using MySocailApp.Application.InfrastructureServices;
using MySocailApp.Core;
using MySocailApp.Domain.QuestionAggregate.Abstracts;
using MySocailApp.Domain.QuestionAggregate.DomainEvents;
using MySocailApp.Domain.UserDomain.UserAggregate.DomainEvents;

namespace MySocailApp.Application.DomainEventConsumers.UserDeletedDomainEventConsumers.QuestionAggregate
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
