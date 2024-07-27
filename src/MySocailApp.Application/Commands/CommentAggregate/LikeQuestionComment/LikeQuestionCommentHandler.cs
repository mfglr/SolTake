using MediatR;
using MySocailApp.Application.Services;
using MySocailApp.Domain.CommentAggregate.Exceptions;
using MySocailApp.Domain.CommentAggregate.Interfaces;

namespace MySocailApp.Application.Commands.QuestionCommentAggregate.LikeQuestionComment
{
    public class LikeQuestionCommentHandler(ICommentWriteRepository repository, IAccessTokenReader accessTokenReader, IUnitOfWork unitOfWork) : IRequestHandler<LikeQuestionCommentDto>
    {
        private readonly ICommentWriteRepository _repository = repository;
        private readonly IAccessTokenReader _accessTokenReader = accessTokenReader;
        private readonly IUnitOfWork _unitOfWork = unitOfWork;

        public async Task Handle(LikeQuestionCommentDto request, CancellationToken cancellationToken)
        {
            var userId = _accessTokenReader.GetRequiredAccountId();
            var comment =
                await _repository.GetWithLikeByIdAsync(request.Id, userId, cancellationToken) ??
                throw new CommentIsNotFoundException();
            comment.Like(userId);
            await _unitOfWork.CommitAsync(cancellationToken);
        }
    }
}
