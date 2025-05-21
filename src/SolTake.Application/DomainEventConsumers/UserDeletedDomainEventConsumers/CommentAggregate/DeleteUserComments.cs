using MediatR;
using MySocailApp.Application.InfrastructureServices;
using SolTake.Domain.CommentAggregate.Abstracts;
using SolTake.Domain.CommentAggregate.DomainEvents;
using SolTake.Domain.UserAggregate.DomainEvents;
using SolTake.Core;

namespace MySocailApp.Application.DomainEventConsumers.UserDeletedDomainEventConsumers.CommentAggregate
{
    public class DeleteUserComments(ICommentWriteRepository commentWriteRepository, IUnitOfWork unitOfWork, IPublisher publisher) : IDomainEventConsumer<UserDeletedDomainEvent>
    {
        private readonly ICommentWriteRepository _commentWriteRepository = commentWriteRepository;
        private readonly IUnitOfWork _unitOfWork = unitOfWork;
        private readonly IPublisher _publisher = publisher;

        public async Task Handle(UserDeletedDomainEvent notification, CancellationToken cancellationToken)
        {
            var comments = await _commentWriteRepository.GetUserCommentsAsync(notification.User.Id, cancellationToken);
            _commentWriteRepository.DeleteRange(comments);
            await _unitOfWork.CommitAsync(cancellationToken);

            foreach (var comment in comments)
                await _publisher.Publish(new CommentDeletedDomainEvent(comment));
        }
    }
}
