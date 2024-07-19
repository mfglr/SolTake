using MediatR;
using MySocailApp.Application.Services;
using MySocailApp.Domain.QuestionAggregate.Excpetions;
using MySocailApp.Domain.QuestionAggregate.Repositories;

namespace MySocailApp.Application.Commands.QuestionAggregate.DislikeQuestion
{
    public class DislikeQuestionHandler(IAccessTokenReader tokenReader, IUnitOfWork unitOfWork, IQuestionWriteRepository repository) : IRequestHandler<DislikeQuestionDto>
    {
        private readonly IAccessTokenReader _tokenReader = tokenReader;
        private readonly IUnitOfWork _unitOfWork = unitOfWork;
        private readonly IQuestionWriteRepository _repository = repository;

        public async Task Handle(DislikeQuestionDto request, CancellationToken cancellationToken)
        {
            var userId = _tokenReader.GetRequiredAccountId();
            var question =
                await _repository.GetWithLikeByIdAsync(request.QuestionId, userId, cancellationToken) ??
                throw new QuestionIsNotFoundException();
            question.Dislike(userId);
            await _unitOfWork.CommitAsync(cancellationToken);
        }
    }
}
