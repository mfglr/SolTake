using MediatR;
using MySocailApp.Application.InfrastructureServices;
using SolTake.Domain.CommentAggregate.Abstracts;
using SolTake.Domain.CommentAggregate.DomainEvents;
using SolTake.Domain.QuestionAggregate.DomainEvents;
using SolTake.Core;

namespace MySocailApp.Application.DomainEventConsumers.QuestionDeletedDomainEventComsumers.CommentAggregate
{
    public class DeleteQuestionComments(ICommentWriteRepository commentWriteRepository, IUnitOfWork unitOfWork, IPublisher publisher) : IDomainEventConsumer<QuestionDeletedDomainEvent>
    {
        private readonly ICommentWriteRepository _commentWriteRepository = commentWriteRepository;
        private readonly IUnitOfWork _unitOfWork = unitOfWork;
        private readonly IPublisher _publisher = publisher;

        public async Task Handle(QuestionDeletedDomainEvent notification, CancellationToken cancellationToken)
        {
            var comments = await _commentWriteRepository.GetQuestionCommentsAsync(notification.Question.Id, cancellationToken);
            _commentWriteRepository.DeleteRange(comments);
            await _unitOfWork.CommitAsync(cancellationToken);
            foreach (var comment in comments)
                await _publisher.Publish(new CommentDeletedDomainEvent(comment));
        }
    }
}
