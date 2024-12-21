using MySocailApp.Domain.CommentAggregate.Abstracts;
using MySocailApp.Domain.CommentAggregate.DomainServices.InternalDomainServices;
using MySocailApp.Domain.CommentAggregate.Entities;
using MySocailApp.Domain.CommentAggregate.Exceptions;
using MySocailApp.Domain.QuestionDomain.QuestionAggregate.Abstracts;
using MySocailApp.Domain.SolutionAggregate.Abstracts;

namespace MySocailApp.Domain.CommentAggregate.DomainServices
{
    public class CommentCreatorDomainService(IQuestionReadRepository questionReadRepository, ISolutionReadRepository solutionReadRepository, ICommentReadRepository commentReadRepository)
    {
        private readonly IQuestionReadRepository _questionReadRepository = questionReadRepository;
        private readonly ISolutionReadRepository _solutionReadRepository = solutionReadRepository;
        private readonly ICommentReadRepository _commentReadRepository = commentReadRepository;

        public async Task CreateAsync(Comment comment, int? questionId, int? solutionId, int? repliedId, CancellationToken cancellationToken)
        {
            if (repliedId != null)
                await ReplyCommentCreatorDomainService
                    .CreateAsync(_commentReadRepository, comment, (int)repliedId, cancellationToken);
            else if (questionId != null)
                await QuestionCommentCreatorDomainService
                    .CreateAsync(_questionReadRepository, comment, (int)questionId, cancellationToken);
            else if (solutionId != null)
                await SolutionCommentCreatorDomainService
                    .CreateAsync(_solutionReadRepository, comment, (int)solutionId, cancellationToken);
            else
                throw new NoRootException();
        }
    }
}
