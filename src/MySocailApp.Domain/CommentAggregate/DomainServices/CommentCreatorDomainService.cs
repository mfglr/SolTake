using MySocailApp.Domain.AppUserAggregate.Interfaces;
using MySocailApp.Domain.CommentAggregate.DomainEvents;
using MySocailApp.Domain.CommentAggregate.Entities;
using MySocailApp.Domain.CommentAggregate.Exceptions;
using MySocailApp.Domain.CommentAggregate.Interfaces;
using MySocailApp.Domain.CommentAggregate.ValueObjects;
using MySocailApp.Domain.QuestionAggregate.Excpetions;
using MySocailApp.Domain.QuestionAggregate.Interfaces;
using MySocailApp.Domain.SolutionAggregate.Exceptions;
using MySocailApp.Domain.SolutionAggregate.Interfaces;

namespace MySocailApp.Domain.CommentAggregate.DomainServices
{
    public class CommentCreatorDomainService(IQuestionReadRepository questionRepository, ISolutionReadRepository solutionRepository, ICommentReadRepository commentReadRepository, IAppUserReadRepository userController, IUserNameReader userNameReader)
    {
        private readonly IQuestionReadRepository _questionRepository = questionRepository;
        private readonly ISolutionReadRepository _solutionRepository = solutionRepository;
        private readonly ICommentReadRepository _commentReadRepository = commentReadRepository;
        private readonly IAppUserReadRepository _userController = userController;
        private readonly IUserNameReader _userNameReader = userNameReader;

        public async Task CreateAsync(Comment comment, int userId, CommentContent content, int? questionId, int? solutionId, int? repliedId, CancellationToken cancellationToken)
        {
            var userNames = _userNameReader.GetUserNames(content.Value);
            var idsOfUsersTagged = await _userController.GetIdsByUserNames(userNames, cancellationToken);

            if (repliedId != null)
            {
                var repliedComment =
                    await _commentReadRepository.GetAsync((int)repliedId, cancellationToken) ??
                    throw new CommentNotFoundException();

                Comment parent;
                if (repliedComment.ParentId != null)
                {
                    parent =
                        await _commentReadRepository.GetAsync((int)repliedComment.ParentId, cancellationToken) ??
                        throw new CommentNotFoundException();

                    if (parent.ParentId != null)
                        throw new CommentIsNotRootException();
                    comment.CreateReplyComment(userId, content, idsOfUsersTagged, parent.Id, (int)repliedId);
                }
                else
                {
                    parent = repliedComment;
                    comment.CreateReplyComment(userId, content, idsOfUsersTagged, (int)repliedId, (int)repliedId);
                }

                if (repliedComment.AppUserId != userId)
                    comment.AddDomainEvent(new CommentRepliedDomainEvent(comment, parent, repliedComment));

                foreach (var id in idsOfUsersTagged)
                    if (id != comment.AppUserId && id != repliedComment.AppUserId)
                        comment.AddDomainEvent(new UserTaggedInCommentDomainEvent(comment, id));
            }
            else if (questionId != null)
            {
                var question =
                    await _questionRepository.GetAsync((int)questionId, cancellationToken) ??
                    throw new QuestionNotFoundException();
                
                comment.CreateQuestionComment(userId, content, idsOfUsersTagged, (int)questionId);
                
                if(question.AppUserId != comment.AppUserId)
                    comment.AddDomainEvent(new QuestionCommentCreatedDomainEvent(comment));

                foreach (var id in idsOfUsersTagged)
                    if (id != comment.AppUserId && id != question.AppUserId)
                        comment.AddDomainEvent(new UserTaggedInCommentDomainEvent(comment, id));
            }
            else if (solutionId != null)
            {
                var solution = 
                    await _solutionRepository.GetAsync((int)solutionId, cancellationToken) ??
                    throw new SolutionNotFoundException();
                
                comment.CreateSolutionComment(userId, content, idsOfUsersTagged, (int)solutionId);
                
                if(solution.AppUserId != comment.AppUserId)
                    comment.AddDomainEvent(new SolutionCommentCreatedDomainEvent(comment));

                foreach (var id in idsOfUsersTagged)
                    if (id != comment.AppUserId && id != solution.AppUserId)
                        comment.AddDomainEvent(new UserTaggedInCommentDomainEvent(comment, id));
            }
            else
                throw new NoRootException();
        }
    }
}
