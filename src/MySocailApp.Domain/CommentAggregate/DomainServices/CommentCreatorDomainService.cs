using MySocailApp.Core;
using MySocailApp.Domain.CommentAggregate.Abstracts;
using MySocailApp.Domain.CommentAggregate.Entities;
using MySocailApp.Domain.CommentAggregate.Exceptions;
using MySocailApp.Domain.QuestionAggregate.Abstracts;
using MySocailApp.Domain.SolutionDomain.SolutionAggregate.Abstracts;
using MySocailApp.Domain.SolutionDomain.SolutionAggregate.Exceptions;

namespace MySocailApp.Domain.CommentAggregate.DomainServices
{
    public class CommentCreatorDomainService(IQuestionReadRepository questionReadRepository, ISolutionReadRepository solutionReadRepository, ICommentReadRepository commentReadRepository)
    {
        private readonly IQuestionReadRepository _questionReadRepository = questionReadRepository;
        private readonly ISolutionReadRepository _solutionReadRepository = solutionReadRepository;
        private readonly ICommentReadRepository _commentReadRepository = commentReadRepository;

        public async Task CreateAsync(Comment comment, int? questionId, int? solutionId, int? repliedId, Login login, CancellationToken cancellationToken)
        {
            if (repliedId != null)
            {
                var replied =
                    await _commentReadRepository.GetAsync((int)repliedId, cancellationToken) ??
                    throw new CommentNotFoundException();

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
                    throw new Exceptions.QuestionNotFoundException();

                comment.CreateQuestionComment(question, login);
            }

            else if (solutionId != null)
            {
                var solution =
                    await _solutionReadRepository.GetAsync((int)solutionId, cancellationToken) ??
                    throw new SolutionNotFoundException();

                comment.CreateSolutionComment(solution, login);
            }
            else
                throw new NoRootException();
        }
    }
}
