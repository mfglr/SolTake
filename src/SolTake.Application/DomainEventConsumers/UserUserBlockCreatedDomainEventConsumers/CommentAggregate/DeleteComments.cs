using MediatR;
using MySocailApp.Application.InfrastructureServices;
using SolTake.Domain.CommentAggregate.Abstracts;
using SolTake.Domain.CommentAggregate.DomainEvents;
using SolTake.Domain.QuestionAggregate.Abstracts;
using MySocailApp.Domain.UserUserBlockAggregate.DomainEvents;
using SolTake.Core;
using SolTake.Domain.CommentAggregate.Entities;
using SolTake.Domain.SolutionAggregate.Abstracts;

namespace MySocailApp.Application.DomainEventConsumers.UserUserBlockCreatedDomainEventConsumers.CommentAggregate
{
    public class DeleteComments(ICommentWriteRepository commentWriteRepsository, IUnitOfWork unitOfWork, IQuestionReadRepository questionReadRepository, ISolutionReadRepository solutionReadRepository, ICommentReadRepository commentReadRepository, IPublisher publisher) : IDomainEventConsumer<UserUserBlockCreatedDomainEvent>
    {
        private readonly ICommentWriteRepository _commentWriteRepsository = commentWriteRepsository;
        private readonly IUnitOfWork _unitOfWork = unitOfWork;
        private readonly IQuestionReadRepository _questionReadRepository = questionReadRepository;
        private readonly ISolutionReadRepository _solutionReadRepository = solutionReadRepository;
        private readonly ICommentReadRepository _commentReadRepository = commentReadRepository;
        private readonly IPublisher _publisher = publisher;

        public async Task Handle(UserUserBlockCreatedDomainEvent notification, CancellationToken cancellationToken)
        {
            var questionIdsOfBlocker = await _questionReadRepository.GetQuestionIdsOfUser(notification.UserUserBlock.BlockerId, cancellationToken);
            var questionComments0 = await _commentWriteRepsository.GetQuestionsComments(questionIdsOfBlocker, notification.UserUserBlock.BlockedId, cancellationToken);
            _commentWriteRepsository.DeleteRange(questionComments0);

            var questionIdsOfBlocked = await _questionReadRepository.GetQuestionIdsOfUser(notification.UserUserBlock.BlockedId, cancellationToken);
            var questionComments1 = await _commentWriteRepsository.GetQuestionsComments(questionIdsOfBlocked, notification.UserUserBlock.BlockerId, cancellationToken);
            _commentWriteRepsository.DeleteRange(questionComments1);


            var solutionIdsOfBlocker = await _solutionReadRepository.GetSolutionIdsOfUser(notification.UserUserBlock.BlockerId, cancellationToken);
            var solutionComments0 = await _commentWriteRepsository.GetSolutionsComments(solutionIdsOfBlocker, notification.UserUserBlock.BlockedId, cancellationToken);
            _commentWriteRepsository.DeleteRange(solutionComments0);

            var solutionIdsOfBlocked = await _solutionReadRepository.GetSolutionIdsOfUser(notification.UserUserBlock.BlockedId, cancellationToken);
            var solutionsComments1 = await _commentWriteRepsository.GetSolutionsComments(solutionIdsOfBlocked, notification.UserUserBlock.BlockerId, cancellationToken);
            _commentWriteRepsository.DeleteRange(solutionsComments1);


            var commentIdsOfBlocker = await _commentReadRepository.GetCommentIdsOfUser(notification.UserUserBlock.BlockerId, cancellationToken);
            var commentReplies0 = await _commentWriteRepsository.GetCommentsReplies(commentIdsOfBlocker, notification.UserUserBlock.BlockedId, cancellationToken);
            _commentWriteRepsository.DeleteRange(commentReplies0);

            var commentIdsOfBlocked = await _commentReadRepository.GetCommentIdsOfUser(notification.UserUserBlock.BlockedId, cancellationToken);
            var commentReplies1 = await _commentWriteRepsository.GetCommentsReplies(commentIdsOfBlocked, notification.UserUserBlock.BlockerId, cancellationToken);
            _commentWriteRepsository.DeleteRange(commentReplies1);


            await _unitOfWork.CommitAsync(cancellationToken);

            IEnumerable<Comment> comments = [
                .. questionComments0,
                .. questionComments1,
                .. solutionComments0,
                .. solutionsComments1,
                .. commentReplies0,
                .. commentReplies1
            ];

            foreach (var comment in comments)
                await _publisher.Publish(new CommentDeletedDomainEvent(comment), cancellationToken);
        }
    }
}
