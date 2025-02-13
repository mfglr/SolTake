using MediatR;
using MySocailApp.Application.InfrastructureServices;
using MySocailApp.Domain.QuestionDomain.QuestionAggregate.Abstracts;

namespace MySocailApp.Application.Commands.QuestionDomain.QuestionUserLikeAggregate.DislikeQuestion
{
    public class DislikeQuestionHandler(IUnitOfWork unitOfWork, IQuestionWriteRepository repository, IAccountAccessor accountAccessor) : IRequestHandler<DislikeQuestionDto>
    {
        private readonly IAccountAccessor _accountAccessor = accountAccessor;
        private readonly IUnitOfWork _unitOfWork = unitOfWork;
        private readonly IQuestionWriteRepository _repository = repository;

        public async Task Handle(DislikeQuestionDto request, CancellationToken cancellationToken)
        {
            
            await _unitOfWork.CommitAsync(cancellationToken);
        }
    }
}
