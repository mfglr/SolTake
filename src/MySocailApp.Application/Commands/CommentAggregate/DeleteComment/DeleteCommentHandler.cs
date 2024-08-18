using MediatR;
using MySocailApp.Application.ApplicationServices;
using MySocailApp.Domain.CommentAggregate.Exceptions;
using MySocailApp.Domain.CommentAggregate.Interfaces;
using MySocailApp.Domain.Shared;

namespace MySocailApp.Application.Commands.CommentAggregate.DeleteComment
{
    public class DeleteCommentHandler(ICommentWriteRepository commentWriteRepository, IUnitOfWork unitOfWork, IAccessTokenReader accessTokenReader) : IRequestHandler<DeleteCommentDto>
    {
        private readonly ICommentWriteRepository _commentWriteRepository = commentWriteRepository;
        private readonly IUnitOfWork _unitOfWork = unitOfWork;
        private readonly IAccessTokenReader _accessTokenReader = accessTokenReader;

        public async Task Handle(DeleteCommentDto request, CancellationToken cancellationToken)
        {
            var userId = _accessTokenReader.GetRequiredAccountId();
            var comment =
                await _commentWriteRepository.GetAsync(request.CommentId, cancellationToken) ??
                throw new CommentNotFoundException();

            if (userId != comment.AppUserId)
                throw new PermissionDeniedToDeleteCommentException();

                _commentWriteRepository.Delete(comment);
            await _unitOfWork.CommitAsync(cancellationToken);
        }
    }
}
