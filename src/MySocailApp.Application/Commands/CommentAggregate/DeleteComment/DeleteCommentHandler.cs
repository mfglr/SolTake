using MediatR;
using MySocailApp.Application.ApplicationServices;
using MySocailApp.Domain.CommentAggregate.DomainEvents;
using MySocailApp.Domain.CommentAggregate.Exceptions;
using MySocailApp.Domain.CommentAggregate.Interfaces;

namespace MySocailApp.Application.Commands.CommentAggregate.DeleteComment
{
    public class DeleteCommentHandler(ICommentWriteRepository commentWriteRepository, IUnitOfWork unitOfWork, IAccessTokenReader accessTokenReader, IPublisher publisher) : IRequestHandler<DeleteCommentDto>
    {
        private readonly ICommentWriteRepository _commentWriteRepository = commentWriteRepository;
        private readonly IUnitOfWork _unitOfWork = unitOfWork;
        private readonly IAccessTokenReader _accessTokenReader = accessTokenReader;
        private readonly IPublisher _publisher = publisher;

        public async Task Handle(DeleteCommentDto request, CancellationToken cancellationToken)
        {
            var userId = _accessTokenReader.GetRequiredAccountId();
            var comment =
                await _commentWriteRepository.GetWithRepliesAndChildrenAsync(request.CommentId, cancellationToken) ??
                throw new CommentNotFoundException();

            if (userId != comment.AppUserId)
                throw new PermissionDeniedToDeleteCommentException();

            comment.Delete();
            _commentWriteRepository.Delete(comment);
            await _unitOfWork.CommitAsync(cancellationToken);

            await _publisher.Publish(new CommentDeletedDomainEvent(request.CommentId),cancellationToken);
        }
    }
}
