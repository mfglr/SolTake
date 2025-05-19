using MediatR;
using MySocailApp.Application.InfrastructureServices;
using SolTake.Domain.CommentAggregate.Abstracts;
using SolTake.Domain.CommentAggregate.DomainEvents;
using MySocailApp.Domain.SolutionAggregate.DomainEvents;
using SolTake.Core;

namespace MySocailApp.Application.DomainEventConsumers.SolutionDeletedDomainEventConsumers.CommentAggregate
{
    public class DeleteSolutionComments(ICommentWriteRepository commentWriteRepository, IUnitOfWork unitOfWork, IPublisher publisher) : IDomainEventConsumer<SolutionDeletedDomainEvent>
    {
        private readonly ICommentWriteRepository _commentWriteRepository = commentWriteRepository;
        private readonly IUnitOfWork _unitOfWork = unitOfWork;
        private readonly IPublisher _publisher = publisher;

        public async Task Handle(SolutionDeletedDomainEvent notification, CancellationToken cancellationToken)
        {
            var comments = await _commentWriteRepository.GetSolutionCommentsAsync(notification.Solution.Id, cancellationToken);
            _commentWriteRepository.DeleteRange(comments);
            await _unitOfWork.CommitAsync(cancellationToken);

            foreach (var comment in comments)
                await _publisher.Publish(new CommentDeletedDomainEvent(comment), cancellationToken);
        }
    }
}
