using MediatR;
using MySocailApp.Application.InfrastructureServices;
using MySocailApp.Core;
using MySocailApp.Domain.CommentAggregate.Abstracts;
using MySocailApp.Domain.CommentAggregate.DomainEvents;
using MySocailApp.Domain.SolutionDomain.SolutionAggregate.DomainEvents;

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
