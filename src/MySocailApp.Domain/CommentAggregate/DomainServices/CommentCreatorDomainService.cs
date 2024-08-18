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

        public async Task CreateAsync(Comment comment, int userId, Content content, int? questionId, int? solutionId, int? parentId, CancellationToken cancellationToken)
        {
            var userNames = _userNameReader.GetUserNames(content.Value);
            var users = await _userController.GetByUserNames(userNames, cancellationToken);
            var idsOfUsersTagged = users.Select(x => x.Id);

            if (parentId != null)
            {
                var parent =
                    await _commentReadRepository.GetAsync((int)parentId, cancellationToken) ??
                    throw new CommentNotFoundException();

                if (parent.ParentId != null)
                    throw new CommentIsNotRootException();

                foreach (var id in comment.Tags.Select(x => x.AppUserId))
                    if (id != parent.AppUserId && id != comment.AppUserId)
                        comment.AddDomainEvent(new UserTaggedInCommentDomainEvent(comment, id));

                comment.CreateReply(userId, content, idsOfUsersTagged, (int)parentId);
            }
            else if (questionId != null)
            {
                if (!await _questionRepository.Exist((int)questionId, cancellationToken))
                    throw new QuestionNotFoundException();
                comment.CreateQuestionComment(userId, content, idsOfUsersTagged, (int)questionId);
            }
            else if (solutionId != null)
            {
                if (!await _solutionRepository.Exist((int)solutionId, cancellationToken))
                    throw new SolutionNotFoundException();
                comment.CreateSolutionComment(userId, content, idsOfUsersTagged, (int)solutionId);
            }
            else
                throw new NoRootException();
        }
    }
}
