using MySocailApp.Core;
using MySocailApp.Domain.CommentAggregate.DomainEvents;
using MySocailApp.Domain.CommentAggregate.Interfaces;
using MySocailApp.Domain.NotificationAggregate.Entities;
using MySocailApp.Domain.NotificationAggregate.Interfaces;
using MySocailApp.Domain.NotificationAggregate.ValueObjects;
using MySocailApp.Domain.QuestionAggregate.Interfaces;
using MySocailApp.Domain.Shared;
using MySocailApp.Domain.SolutionAggregate.Interfaces;

namespace MySocailApp.Application.DomainEventConsumers.CommentCreatedEventConsumers
{
    public class CreateNotification(IQuestionReadRepository questionRepository, ISolutionReadRepository solutionRepository, ICommentReadRepository commentRepository, INotificationWriteRepository notificationRepository, IUnitOfWork unitOfWork) : IDomainEventConsumer<CommentCreatedDomainEvent>
    {
        private readonly IQuestionReadRepository _questionRepository = questionRepository;
        private readonly ISolutionReadRepository _solutionRepository = solutionRepository;
        private readonly ICommentReadRepository _commentRepository = commentRepository;
        private readonly INotificationWriteRepository _notificationRepository = notificationRepository;
        private readonly IUnitOfWork _unitOfWork = unitOfWork;

        public async Task Handle(CommentCreatedDomainEvent notification, CancellationToken cancellationToken)
        {
            int ownerId;
            var comment = notification.Comment;
            ParentType? type = null;
            int? parentId = null;

            if (comment.QuestionId != null)
            {
                var question = await _questionRepository.GetAsync((int)comment.QuestionId, cancellationToken);
                if (question == null) return;
                ownerId = question.AppUserId;
            }
            else if (comment.SolutionId != null)
            {
                var solution = await _solutionRepository.GetAsync((int)comment.SolutionId, cancellationToken);
                if (solution == null) return;
                ownerId = solution.AppUserId;
            }
            else if (comment.ParentId != null)
            {
                var parent = await _commentRepository.GetAsync((int)comment.ParentId, cancellationToken);
                if (parent == null) return;

                ownerId = parent.AppUserId;
                type = parent.QuestionId == null ? ParentType.Solution : ParentType.Question;
                parentId = parent.QuestionId ?? parent.SolutionId;
            }
            else
                return;

            if (ownerId == comment.AppUserId)
                return;

            var n = Notification.CreateCommentCreatedNotification(ownerId, comment.AppUserId, comment.Id, type, parentId);
            await _notificationRepository.CreateAsync(n,cancellationToken);

            await _unitOfWork.CommitAsync(cancellationToken);
        }
    }
}
