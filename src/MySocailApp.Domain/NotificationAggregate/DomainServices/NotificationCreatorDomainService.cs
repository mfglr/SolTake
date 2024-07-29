using MySocailApp.Domain.CommentAggregate.Entities;
using MySocailApp.Domain.CommentAggregate.Exceptions;
using MySocailApp.Domain.CommentAggregate.Interfaces;
using MySocailApp.Domain.NotificationAggregate.Entities;
using MySocailApp.Domain.QuestionAggregate.Excpetions;
using MySocailApp.Domain.QuestionAggregate.Interfaces;
using MySocailApp.Domain.SolutionAggregate.Exceptions;
using MySocailApp.Domain.SolutionAggregate.Interfaces;

namespace MySocailApp.Domain.NotificationAggregate.DomainServices
{
    public class NotificationCreatorDomainService(IQuestionReadRepository questionRepository, ISolutionReadRepository solutionRepository, ICommentReadRepository commentRepository)
    {
        private readonly IQuestionReadRepository _questionRepository = questionRepository;
        private readonly ISolutionReadRepository _solutionRepository = solutionRepository;
        private readonly ICommentReadRepository _commentRepository = commentRepository;

        public async Task CreateCommentCreatedNotificationAsync(Notification notification, Comment comment, CancellationToken cancellationToken)
        {
            int ownerId;
            if (comment.QuestionId != null)
                ownerId =
                    (await _questionRepository.GetAsync((int)comment.QuestionId, cancellationToken))?.AppUserId ??
                    throw new QuestionNotFoundException();

            else if (comment.SolutionId != null)
                ownerId =
                    (await _solutionRepository.GetAsync((int)comment.SolutionId, cancellationToken))?.AppUserId ??
                    throw new SolutionNotFoundException();
            else
                ownerId =
                    (await _commentRepository.GetAsync((int)comment.ParentId!, cancellationToken))?.AppUserId ??
                    throw new CommentNotFoundException();

            if (ownerId == comment.AppUserId)
                return;

            notification.CreateCommentCreatedNotification(ownerId, comment.Id);
        }
    }
}
