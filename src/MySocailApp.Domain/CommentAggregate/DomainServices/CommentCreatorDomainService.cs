using MySocailApp.Domain.CommentAggregate.Entities;
using MySocailApp.Domain.CommentAggregate.Exceptions;
using MySocailApp.Domain.CommentAggregate.Interfaces;
using MySocailApp.Domain.CommentAggregate.ValueObjects;

namespace MySocailApp.Domain.CommentAggregate.DomainServices
{

    public class CommentCreatorDomainService(IQuestionFinder questionController, ISolutionController solutionController, ICommentFinder commentController, IAppUserFinder userController, IUserNameReader userNameReader)
    {
        private readonly IQuestionFinder _questionController = questionController;
        private readonly ISolutionController _solutionController = solutionController;
        private readonly ICommentFinder _commentController = commentController;
        private readonly IAppUserFinder _userController = userController;
        private readonly IUserNameReader _userNameReader = userNameReader;

        public async Task CreateAsync(Comment comment, int userId, Content content, int? questionId, int? solutionId, int? parentId, CancellationToken cancellationToken)
        {
            var userNames = _userNameReader.GetUserNames(content.Value);
            var users = await _userController.GetByUserNames(userNames, cancellationToken);
            var idsOfUsersTagged = users.Select(x => x.Id);

            if (parentId != null)
            {
                var parent =
                    await _commentController.GetAsync((int)parentId, cancellationToken) ??
                    throw new CommentToReplyIsNotFoundException();

                if (parent.ParentId != null)
                    throw new CommentIsNotRootException();

                comment.CreateReply(userId, content, idsOfUsersTagged, (int)parentId);
            }
            else if (questionId != null)
            {
                if (!await _questionController.Exist((int)questionId, cancellationToken))
                    throw new QuestionIsNotFoundException();
                comment.CreateQuestionComment(userId, content, idsOfUsersTagged, (int)questionId);
            }
            else if (solutionId != null)
            {
                if (!await _solutionController.Exist((int)solutionId, cancellationToken))
                    throw new SolutionIsNotFoundException();
                comment.CreateSolutionComment(userId, content, idsOfUsersTagged, (int)solutionId);
            }
            else
                throw new NoRootException();
        }
    }
}
