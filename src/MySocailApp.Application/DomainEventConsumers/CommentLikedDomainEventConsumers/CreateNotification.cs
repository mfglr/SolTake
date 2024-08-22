using MySocailApp.Application.ApplicationServices;
using MySocailApp.Core;
using MySocailApp.Domain.CommentAggregate.DomainEvents;
using MySocailApp.Domain.CommentAggregate.Entities;
using MySocailApp.Domain.CommentAggregate.Interfaces;
using MySocailApp.Domain.NotificationAggregate.Entities;
using MySocailApp.Domain.NotificationAggregate.Interfaces;

namespace MySocailApp.Application.DomainEventConsumers.CommentLikedDomainEventConsumers
{
    public class CreateNotification(INotificationWriteRepository repository, IUnitOfWork unitOfWork, ICommentReadRepository commentReadRepository) : IDomainEventConsumer<CommentLikedDomainEvent>
    {
        private readonly ICommentReadRepository _commentReadRepository = commentReadRepository;
        private readonly INotificationWriteRepository _repository = repository;
        private readonly IUnitOfWork _unitOfWork = unitOfWork;

        public async Task Handle(CommentLikedDomainEvent notification, CancellationToken cancellationToken)
        {
            //var comment = notification.Comment;
            //Comment? parent = null;
            //if(comment.ParentId != null)
            //{
            //    parent = await _commentReadRepository.GetAsync((int)comment.ParentId, cancellationToken);
            //    if (parent == null) return;
            //}

            //await _repository.CreateAsync(
            //    Notification.CommentLikedNotification(
            //        notification.Comment.AppUserId,
            //        comment.QuestionId ?? parent?.QuestionId,
            //        comment.SolutionId ?? parent?.SolutionId,
            //        comment.ParentId,
            //        comment.Id,
            //        notification.LikerId
            //    ),
            //    cancellationToken
            //);
            //await _unitOfWork.CommitAsync(cancellationToken);
        }
    }
}
