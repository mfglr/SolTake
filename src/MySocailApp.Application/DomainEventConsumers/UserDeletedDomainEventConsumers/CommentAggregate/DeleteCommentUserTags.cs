using MySocailApp.Application.InfrastructureServices;
using MySocailApp.Core;
using MySocailApp.Domain.CommentDomain.CommentAggregate.Abstracts;
using MySocailApp.Domain.UserDomain.UserAggregate.DomainEvents;

namespace MySocailApp.Application.DomainEventConsumers.UserDeletedDomainEventConsumers.CommentAggregate
{
    public class DeleteCommentUserTags(ICommentWriteRepository commentWriteRepository, IUnitOfWork unitOfWork) : IDomainEventConsumer<UserDeletedDomainEvent>
    {
        private readonly ICommentWriteRepository _commentWriteRepository = commentWriteRepository;
        private readonly IUnitOfWork _unitOfWork = unitOfWork;

        public async Task Handle(UserDeletedDomainEvent notification, CancellationToken cancellationToken)
        {
            var comments = await _commentWriteRepository.GetCommentsByTag(notification.User.Id, cancellationToken);
            foreach (var comment in comments)
                comment.DeleteTag(notification.User.Id);
            await _unitOfWork.CommitAsync(cancellationToken);
        }
    }
}
