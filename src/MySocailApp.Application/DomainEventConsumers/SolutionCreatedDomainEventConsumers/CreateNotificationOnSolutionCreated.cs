using MySocailApp.Application.Services;
using MySocailApp.Core;
using MySocailApp.Domain.NotificationAggregate.Entities;
using MySocailApp.Domain.NotificationAggregate.Interfaces;
using MySocailApp.Domain.QuestionAggregate.Interfaces;
using MySocailApp.Domain.SolutionAggregate.DomainEvents;

namespace MySocailApp.Application.DomainEventConsumers.SolutionCreatedDomainEventConsumers
{
    public class CreateNotificationOnSolutionCreated(INotificationWriteRepository notificationRepsitory, IUnitOfWork unitOfWork, IQuestionReadRepository questionRepository) : IDomainEventConsumer<SolutionCreatedDomainEvent>
    {
        private readonly INotificationWriteRepository _notificationRepsitory = notificationRepsitory;
        private readonly IQuestionReadRepository _questionRepository = questionRepository;
        private readonly IUnitOfWork _unitOfWork = unitOfWork;

        public async Task Handle(SolutionCreatedDomainEvent notification, CancellationToken cancellationToken)
        {
            var solution = notification.Solution;
            var question = await _questionRepository.GetAsync(solution.QuestionId, cancellationToken);
            if(question != null)
            {
                await _notificationRepsitory.CreateAsync(
                    Notification.SolutionCreatedNotification(question.AppUserId, solution.Id, solution.AppUserId),
                    cancellationToken
                );
                await _unitOfWork.CommitAsync(cancellationToken);
            }
        }
    }
}
