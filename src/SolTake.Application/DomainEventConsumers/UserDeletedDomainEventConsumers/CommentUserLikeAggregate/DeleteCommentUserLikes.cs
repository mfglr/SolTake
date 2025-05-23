using SolTake.Application.InfrastructureServices;
using SolTake.Domain.UserAggregate.DomainEvents;
using SolTake.Core;
using SolTake.Domain.CommentUserLikeAggregate.Abstracts;

namespace SolTake.Application.DomainEventConsumers.UserDeletedDomainEventConsumers.CommentUserLikeAggregate
{
    public class DeleteCommentUserLikes(IUnitOfWork unitOfWork, ICommentUserLikeWriteRepository commentUserLikeWriteRepository) : IDomainEventConsumer<UserDeletedDomainEvent>
    {
        private readonly ICommentUserLikeWriteRepository _commentUserLikeWriteRepository = commentUserLikeWriteRepository;
        private readonly IUnitOfWork _unitOfWork = unitOfWork;

        public async Task Handle(UserDeletedDomainEvent notification, CancellationToken cancellationToken)
        {
            var likes = await _commentUserLikeWriteRepository.GetByUserId(notification.User.Id, cancellationToken);
            _commentUserLikeWriteRepository.DeleteRange(likes);
            await _unitOfWork.CommitAsync(cancellationToken);
        }
    }
}
