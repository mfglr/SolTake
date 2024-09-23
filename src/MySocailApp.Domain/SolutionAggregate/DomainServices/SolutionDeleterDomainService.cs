using MySocailApp.Domain.CommentAggregate.Interfaces;
using MySocailApp.Domain.SolutionAggregate.Interfaces;

namespace MySocailApp.Domain.SolutionAggregate.DomainServices
{
    public class SolutionDeleterDomainService(ISolutionWriteRepository solutionWriteRepository, ICommentWriteRepository commentWriteRepository)
    {
        private readonly ISolutionWriteRepository _solutionWriteRepository = solutionWriteRepository;
        private readonly ICommentWriteRepository _commentWriteRepository = commentWriteRepository;

        public async Task DeleteAsync(int solutionId, CancellationToken cancellationToken)
        {
            var solution = await _solutionWriteRepository.GetWithCommentsByIdAsync(solutionId, cancellationToken);
            if (solution == null) return;
            
            foreach (var comment in solution.Comments)
            {
                comment.SetRepliedIdsAsNull();
                _commentWriteRepository.DeleteRange(comment.Children);
                _commentWriteRepository.Delete(comment);
            }
            _solutionWriteRepository.Delete(solution);
        }
    }
}
