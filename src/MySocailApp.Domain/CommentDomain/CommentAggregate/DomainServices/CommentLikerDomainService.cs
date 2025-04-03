using MySocailApp.Core;
using MySocailApp.Domain.CommentDomain.CommentAggregate.Abstracts;
using MySocailApp.Domain.CommentDomain.CommentAggregate.Entities;
using MySocailApp.Domain.CommentDomain.CommentAggregate.Exceptions;
using MySocailApp.Domain.CommentDomain.CommentUserLikeAggregate.Abstracts;
using MySocailApp.Domain.CommentDomain.CommentUserLikeAggregate.Entities;
using MySocailApp.Domain.CommentDomain.CommentUserLikeAggregate.Exceptions;

namespace MySocailApp.Domain.CommentDomain.CommentAggregate.DomainServices
{
    public class CommentLikerDomainService(ICommentUserLikeReadRepository commentUserLikeReadRepository, ICommentReadRepository commentReadRepository)
    {
        private readonly ICommentUserLikeReadRepository _commentUserLikeReadRepository = commentUserLikeReadRepository;
        private readonly ICommentReadRepository _commentReadRepository = commentReadRepository;

        public async Task LikeAsync(CommentUserLike like, Login login, CancellationToken cancellationToken)
        {
            var comment = 
                await _commentReadRepository.GetAsync(like.CommentId, cancellationToken) ?? 
                throw new CommentNotFoundException();

            if (await _commentUserLikeReadRepository.ExistAsync(like.CommentId, like.UserId, cancellationToken))
                throw new CommentAlreadyLikedException();

            like.Create(comment,login);
        }
    }
}
