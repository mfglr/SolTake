using MediatR;
using MySocailApp.Application.Services;
using MySocailApp.Domain.QuestionCommentAggregate.Exceptions;
using MySocailApp.Domain.QuestionCommentAggregate.Interfaces;

namespace MySocailApp.Application.Commands.QuestionCommentAggregate.DislikeQuestionComment
{
    public class DislikeQuestionCommentHandler(IQuestionCommentWriteRepository repository, IAccessTokenReader accessTokenReader, IUnitOfWork unitOfWork) : IRequestHandler<DislikeQuestionCommentDto>
    {
        private readonly IQuestionCommentWriteRepository _repository = repository;
        private readonly IAccessTokenReader _accessTokenReader = accessTokenReader;
        private readonly IUnitOfWork _unitOfWork = unitOfWork;

        public async Task Handle(DislikeQuestionCommentDto request, CancellationToken cancellationToken)
        {
            var userId = _accessTokenReader.GetRequiredAccountId();
            var comment =
                await _repository.GetWithLikeByIdAsync(request.Id, userId, cancellationToken) ??
                throw new QuestionCommentIsNotFoundException();
            comment.Dislike(userId);
            await _unitOfWork.CommitAsync(cancellationToken);
        }
    }
}
