using SolTake.Domain.QuestionAggregate.Abstracts;
using SolTake.Domain.UserUserBlockAggregate.Abstracts;
using SolTake.Core;
using SolTake.Domain.CommentAggregate.Abstracts;
using SolTake.Domain.CommentAggregate.Entities;
using SolTake.Domain.CommentAggregate.Exceptions;
using SolTake.Domain.SolutionAggregate.Abstracts;

namespace SolTake.Domain.CommentAggregate.DomainServices
{
    public class CommentCreatorDomainService(IQuestionReadRepository questionReadRepository, ISolutionReadRepository solutionReadRepository, ICommentReadRepository commentReadRepository, IUserUserBlockRepository userUserBlockRepository)
    {
        private readonly IQuestionReadRepository _questionReadRepository = questionReadRepository;
        private readonly ISolutionReadRepository _solutionReadRepository = solutionReadRepository;
        private readonly ICommentReadRepository _commentReadRepository = commentReadRepository;
        private readonly IUserUserBlockRepository _userUserBlockRepository = userUserBlockRepository;

        public async Task CreateAsync(Comment comment, int? questionId, int? solutionId, int? repliedId, Login login, CancellationToken cancellationToken)
        {
            if (repliedId != null)
            {
                var replied =
                    await _commentReadRepository.GetAsync((int)repliedId, cancellationToken) ??
                    throw new CommentNotFoundException();

                if (await _userUserBlockRepository.ExistAsync(replied.UserId, comment.UserId, cancellationToken))
                    throw new CommentNotFoundException();

                if(await _userUserBlockRepository.ExistAsync(comment.UserId, replied.UserId, cancellationToken))
                    throw new UserBlockedException();

                Comment parent;
                if (replied.ParentId != null)
                    parent =
                        await _commentReadRepository.GetAsync((int)replied.ParentId, cancellationToken) ??
                        throw new CommentNotFoundException();
                else parent = replied;

                comment.ReplyComment(login, parent, replied);
            }
            else if (questionId != null)
            {
                var question =
                    await _questionReadRepository.GetAsync((int)questionId, cancellationToken) ??
                    throw new QuestionNotFoundException();

                if(await _userUserBlockRepository.ExistAsync(question.UserId, comment.UserId,cancellationToken))
                    throw new QuestionNotFoundException();

                if (await _userUserBlockRepository.ExistAsync(comment.UserId, question.UserId, cancellationToken))
                    throw new UserBlockedException();

                comment.CreateQuestionComment(question, login);
            }

            else if (solutionId != null)
            {
                var solution =
                    await _solutionReadRepository.GetAsync((int)solutionId, cancellationToken) ??
                    throw new SolutionNotFoundException();

                if (await _userUserBlockRepository.ExistAsync(solution.UserId, comment.UserId, cancellationToken))
                    throw new SolutionNotFoundException();

                if (await _userUserBlockRepository.ExistAsync(comment.UserId, solution.UserId, cancellationToken))
                    throw new UserBlockedException();

                comment.CreateSolutionComment(solution, login);
            }
            else
                throw new NoRootException();
        }
    }
}
