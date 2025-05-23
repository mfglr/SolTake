using MediatR;
using SolTake.Application.InfrastructureServices;
using SolTake.Domain.CommentAggregate.Abstracts;
using SolTake.Domain.CommentAggregate.DomainEvents;
using SolTake.Core;

namespace SolTake.Application.DomainEventConsumers.CommentDeletedDomainEventConsumers.CommentAggregate
{
    public class DeleteChildren(ICommentWriteRepository commentWriteRepository, IUnitOfWork unitOfWork, IPublisher publisher) : IDomainEventConsumer<CommentDeletedDomainEvent>
    {
        private readonly ICommentWriteRepository _commentWriteRepository = commentWriteRepository;
        private readonly IUnitOfWork _unitOfWork = unitOfWork;
        private readonly IPublisher _publisher = publisher;

        public async Task Handle(CommentDeletedDomainEvent notification, CancellationToken cancellationToken)
        {
            var replies = await _commentWriteRepository.GetRepliesAsync(notification.Comment.Id, cancellationToken);
            foreach (var reply in replies)
                reply.SetRepliedIdNull();

            var chidren = await _commentWriteRepository.GetChildrenAsync(notification.Comment.Id, cancellationToken);
            _commentWriteRepository.DeleteRange(chidren);

            await _unitOfWork.CommitAsync(cancellationToken);

            foreach (var child in chidren)
                await _publisher.Publish(new CommentDeletedDomainEvent(child), cancellationToken);
        }
    }
}
