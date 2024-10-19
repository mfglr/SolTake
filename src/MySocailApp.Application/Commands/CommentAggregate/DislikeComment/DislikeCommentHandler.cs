using MediatR;
using MySocailApp.Application.ApplicationServices;
using MySocailApp.Domain.CommentAggregate.Abstracts;
using MySocailApp.Domain.CommentAggregate.Exceptions;

namespace MySocailApp.Application.Commands.CommentAggregate.DislikeComment
{
    public class DislikeCommentHandler(ICommentWriteRepository repository, IAccessTokenReader accessTokenReader, IUnitOfWork unitOfWork) : IRequestHandler<DislikeCommentDto>
    {
        private readonly ICommentWriteRepository _repository = repository;
        private readonly IAccessTokenReader _accessTokenReader = accessTokenReader;
        private readonly IUnitOfWork _unitOfWork = unitOfWork;

        public async Task Handle(DislikeCommentDto request, CancellationToken cancellationToken)
        {
            var userId = _accessTokenReader.GetRequiredAccountId();
            var comment =
                await _repository.GetWithLikeByIdAsync(request.CommentId, userId, cancellationToken) ??
                throw new CommentNotFoundException();
            comment.Dislike(userId);
            await _unitOfWork.CommitAsync(cancellationToken);
        }
    }
}
