using MySocailApp.Core;
using MySocailApp.Domain.CommentAggregate.DomainEvents;
using MySocailApp.Domain.CommentAggregate.Exceptions;
using MySocailApp.Domain.CommentAggregate.Interfaces;
using MySocailApp.Domain.NotificationAggregate.Entities;
using MySocailApp.Domain.NotificationAggregate.Interfaces;
using MySocailApp.Domain.QuestionAggregate.Excpetions;
using MySocailApp.Domain.QuestionAggregate.Interfaces;
using MySocailApp.Domain.Shared;
using MySocailApp.Domain.SolutionAggregate.Exceptions;
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

            if (comment.QuestionId != null)
                ownerId =
                    (await _questionRepository.GetAsync((int)comment.QuestionId, cancellationToken))?.AppUserId ??
                    throw new QuestionNotFoundException();
            else if (comment.SolutionId != null)
                ownerId =
                (await _solutionRepository.GetAsync((int)comment.SolutionId, cancellationToken))?.AppUserId ??
                    throw new SolutionNotFoundException();
            else if (comment.ParentId != null)
                ownerId =
                    (await _commentRepository.GetAsync((int)comment.ParentId, cancellationToken))?.AppUserId ??
                    throw new CommentNotFoundException();
            else
                throw new NoRootException();

            if (ownerId == comment.AppUserId)
                return;

            await _notificationRepository.CreateAsync(
                Notification.CreateCommentCreatedNotification(ownerId, comment.Id, comment.AppUserId),
                cancellationToken
            );

            await _unitOfWork.CommitAsync(cancellationToken);

        }
    }
}
