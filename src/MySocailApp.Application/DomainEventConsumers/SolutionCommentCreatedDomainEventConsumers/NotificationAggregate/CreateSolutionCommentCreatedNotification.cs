using MediatR;
using MySocailApp.Application.InfrastructureServices;
using MySocailApp.Core;
using MySocailApp.Domain.CommentAggregate.DomainEvents;
using MySocailApp.Domain.NotificationDomain.NotificationAggregate.DomainEvents;
using MySocailApp.Domain.NotificationDomain.NotificationAggregate.Entities;
using MySocailApp.Domain.NotificationDomain.NotificationAggregate.Interfaces;
using MySocailApp.Domain.SolutionAggregate.Abstracts;

namespace MySocailApp.Application.DomainEventConsumers.SolutionCommentCreatedDomainEventConsumers.NotificationAggregate
{
    public class CreateSolutionCommentCreatedNotification(ISolutionReadRepository solutionReadRepository, INotificationWriteRepository notificationWriteRepository, IUnitOfWork unitOfWork, IPublisher publisher) : IDomainEventConsumer<SolutionCommentCreatedDomainEvent>
    {
        private readonly ISolutionReadRepository _solutionReadRepository = solutionReadRepository;
        private readonly INotificationWriteRepository _notificationWriteRepository = notificationWriteRepository;
        private readonly IUnitOfWork _unitOfWork = unitOfWork;
        private readonly IPublisher _publisher = publisher;

        public async Task Handle(SolutionCommentCreatedDomainEvent notification, CancellationToken cancellationToken)
        {
            var comment = notification.Comment;
            var solution = await _solutionReadRepository.GetAsync((int)comment.SolutionId!, cancellationToken);
            if (solution == null) return;

            var n = Notification.SolutionCommentCreatedNotification(solution.UserId, comment.UserId, comment.Id, solution.Id, solution.QuestionId);
            await _notificationWriteRepository.CreateAsync(n, cancellationToken);
            await _unitOfWork.CommitAsync(cancellationToken);

            await _publisher.Publish(new SolutionCommentNotificationCreatedDomainEvent(n), cancellationToken);
        }
    }
}
