using MySocailApp.Core;
using MySocailApp.Domain.CommentAggregate.Abstracts;
using MySocailApp.Domain.CommentUserLikeAggregate.Abstracts;
using MySocailApp.Domain.CommentUserLikeAggregate.Entities;
using MySocailApp.Domain.CommentUserLikeAggregate.Exceptions;
using MySocailApp.Domain.UserDomain.UserUserBlockAggregate.Abstracts;

namespace MySocailApp.Domain.CommentUserLikeAggregate.DomainServices
{
    public class CommentUserLikeCreatorDomainService(IUserUserBlockRepository userUserBlockRepository, ICommentReadRepository commentReadRepository, ICommentUserLikeReadRepository commentUserLikeReadRepository)
    {
        private readonly IUserUserBlockRepository _userUserBlockRepository = userUserBlockRepository;
        private readonly ICommentReadRepository _commentReadRepository = commentReadRepository;
        private readonly ICommentUserLikeReadRepository _commentUserLikeReadRepository = commentUserLikeReadRepository;

        public async Task CreateAsync(CommentUserLike commentUserLike, Login login, CancellationToken cancellationToken)
        {
            var comment =
                await _commentReadRepository.GetAsync(commentUserLike.CommentId, cancellationToken) ??
                throw new CommentNotFoundException();

            if (await _userUserBlockRepository.ExistAsync(comment.UserId, commentUserLike.UserId, cancellationToken))
                throw new CommentNotFoundException();

            if (await _userUserBlockRepository.ExistAsync(commentUserLike.UserId, comment.UserId, cancellationToken))
                throw new UserBlockedException();

            if (await _commentUserLikeReadRepository.ExistAsync(commentUserLike.CommentId, commentUserLike.UserId, cancellationToken))
                throw new CommentAlreadyLikedException();

            commentUserLike.Create(comment, login);
        }
    }
}
