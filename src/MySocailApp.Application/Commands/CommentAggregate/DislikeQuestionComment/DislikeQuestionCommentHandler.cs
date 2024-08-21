using MediatR;
using MySocailApp.Application.ApplicationServices;
using MySocailApp.Domain.CommentAggregate.Exceptions;
using MySocailApp.Domain.CommentAggregate.Interfaces;

namespace MySocailApp.Application.Commands.QuestionCommentAggregate.DislikeQuestionComment
{
    public class DislikeQuestionCommentHandler(ICommentWriteRepository repository, IAccessTokenReader accessTokenReader, IUnitOfWork unitOfWork) : IRequestHandler<DislikeQuestionCommentDto>
    {
        private readonly ICommentWriteRepository _repository = repository;
        private readonly IAccessTokenReader _accessTokenReader = accessTokenReader;
        private readonly IUnitOfWork _unitOfWork = unitOfWork;

        public async Task Handle(DislikeQuestionCommentDto request, CancellationToken cancellationToken)
        {
            var userId = _accessTokenReader.GetRequiredAccountId();
            var comment =
                await _repository.GetWithLikeByIdAsync(request.Id, userId, cancellationToken) ??
                throw new CommentNotFoundException();
            comment.Dislike(userId);
            await _unitOfWork.CommitAsync(cancellationToken);
        }
    }
}
