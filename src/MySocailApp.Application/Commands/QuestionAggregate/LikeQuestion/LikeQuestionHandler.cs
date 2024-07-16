using MediatR;
using MySocailApp.Application.Services;
using MySocailApp.Domain.QuestionAggregate;
using MySocailApp.Domain.QuestionAggregate.Excpetions;

namespace MySocailApp.Application.Commands.QuestionAggregate.LikeQuestion
{
    public class LikeQuestionHandler(IAccountAccessor accountAccessor, IQuestionWriteRepository repository, IUnitOfWork unitOfWork) : IRequestHandler<LikeQuestionDto>
    {
        private readonly IAccountAccessor _accountAccessor = accountAccessor;
        private readonly IQuestionWriteRepository _repository = repository;
        private readonly IUnitOfWork _unitOfWork = unitOfWork;

        public async Task Handle(LikeQuestionDto request, CancellationToken cancellationToken)
        {
            var userId = _accountAccessor.Account.Id;
            var question = 
                await _repository.GetWithLikeByIdAsync(request.QuestionId, userId, cancellationToken) ??
                throw new QuestionIsNotFoundException();
            question.Like(userId);
            await _unitOfWork.CommitAsync(cancellationToken);
        }
    }
}
