using MySocailApp.Application.ApplicationServices;
using MySocailApp.Core;
using MySocailApp.Domain.AppUserAggregate.DomainEvents;
using MySocailApp.Domain.CommentAggregate.Interfaces;

namespace MySocailApp.Application.DomainEventConsumers.UserAggregate.UserDeletedDomainEventConsumers
{
    public class DeleteCommentUserLikes(ICommentWriteRepository commentWriteRepository, IUnitOfWork unitOfWork) : IDomainEventConsumer<UserDeletedDomainEvent>
    {
        private readonly ICommentWriteRepository _commentWriteRepository = commentWriteRepository;
        private readonly IUnitOfWork _unitOfWork = unitOfWork;

        public async Task Handle(UserDeletedDomainEvent notification, CancellationToken cancellationToken)
        {
            var comments = await _commentWriteRepository.GetCommentsLikedByUserId(notification.User.Id,cancellationToken);
            foreach (var comment in comments)
                comment.DeleteLike(notification.User.Id);
            await _unitOfWork.CommitAsync(cancellationToken);
        }
    }
}
