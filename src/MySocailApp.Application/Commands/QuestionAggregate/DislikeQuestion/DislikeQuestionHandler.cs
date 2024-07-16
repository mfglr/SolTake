using MediatR;
using MySocailApp.Application.Services;
using MySocailApp.Domain.QuestionAggregate;
using MySocailApp.Domain.QuestionAggregate.Excpetions;

namespace MySocailApp.Application.Commands.QuestionAggregate.DislikeQuestion
{
    public class DislikeQuestionHandler(IAccountAccessor accountAccessor, IUnitOfWork unitOfWork, IQuestionWriteRepository repository) : IRequestHandler<DislikeQuestionDto>
    {
        private readonly IAccountAccessor _accountAccessor = accountAccessor;
        private readonly IUnitOfWork _unitOfWork = unitOfWork;
        private readonly IQuestionWriteRepository _repository = repository;

        public async Task Handle(DislikeQuestionDto request, CancellationToken cancellationToken)
        {
            var userId = _accountAccessor.Account.Id;
            var question =
                await _repository.GetWithLikeByIdAsync(request.QuestionId, userId, cancellationToken) ??
                throw new QuestionIsNotFoundException();
            question.Dislike(userId);
            await _unitOfWork.CommitAsync(cancellationToken);
        }
    }
}
