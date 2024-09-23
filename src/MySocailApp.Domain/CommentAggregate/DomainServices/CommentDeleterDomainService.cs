using MySocailApp.Domain.CommentAggregate.Interfaces;

namespace MySocailApp.Domain.CommentAggregate.DomainServices
{
    public class CommentDeleterDomainService(ICommentWriteRepository commentWriteRepository)
    {
        private readonly ICommentWriteRepository _commentWriteRepository = commentWriteRepository;

        public async Task DeleteAsync(int commentId,CancellationToken cancellationToken)
        {
            var comment = await _commentWriteRepository.GetWithRepliesAndChildrenAsync(commentId, cancellationToken);
            if (comment == null) return;
            
            comment.SetRepliedIdsAsNull();
            _commentWriteRepository.DeleteRange(comment.Children);
            _commentWriteRepository.Delete(comment);
        }
    }
}
