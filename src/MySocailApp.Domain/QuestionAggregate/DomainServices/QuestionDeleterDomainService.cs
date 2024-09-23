using MySocailApp.Domain.CommentAggregate.Interfaces;
using MySocailApp.Domain.QuestionAggregate.Interfaces;
using MySocailApp.Domain.SolutionAggregate.Interfaces;

namespace MySocailApp.Domain.QuestionAggregate.DomainServices
{
    public class QuestionDeleterDomainService(IQuestionWriteRepository questionWriteRepository, ICommentWriteRepository commentWriteRepository, ISolutionWriteRepository solutionWriteRepository)
    {
        private readonly IQuestionWriteRepository _questionWriteRepository = questionWriteRepository;
        private readonly ICommentWriteRepository _commentWriteRepository = commentWriteRepository;
        private readonly ISolutionWriteRepository _solutionWriteRepository = solutionWriteRepository;

        public async Task DeleteAsync(int questionId, CancellationToken cancellationToken)
        {
            var question = await _questionWriteRepository.GetQuestionWithAllAsync(questionId, cancellationToken);
            if (question == null) return;

            foreach(var comment in question.Comments)
            {
                comment.SetRepliedIdsAsNull();
                _commentWriteRepository.DeleteRange(comment.Children);
                _commentWriteRepository.Delete(comment);
            }

            foreach(var solution in question.Solutions)
            {
                foreach (var comment in solution.Comments)
                {
                    comment.SetRepliedIdsAsNull();
                    _commentWriteRepository.DeleteRange(comment.Children);
                    _commentWriteRepository.Delete(comment);
                }
                _solutionWriteRepository.Delete(solution);
            }
            _questionWriteRepository.Delete(question);
        }
    }
}
