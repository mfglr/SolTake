using MediatR;
using MySocailApp.Application.InfrastructureServices;
using MySocailApp.Domain.QuestionDomain.QuestionUserLikeAggregate.Abstracts;
using MySocailApp.Domain.QuestionDomain.QuestionUserLikeAggregate.Exceptions;

namespace MySocailApp.Application.Commands.QuestionDomain.QuestionUserLikeAggregate.DislikeQuestion
{
    public class DislikeQuestionHandler(IUnitOfWork unitOfWork, IUserAccessor userAccessor, IQuestionUserLikeWriteRepository questionUserLikeWriteRepository) : IRequestHandler<DislikeQuestionDto>
    {
        private readonly IUserAccessor _userAccessor = userAccessor;
        private readonly IUnitOfWork _unitOfWork = unitOfWork;
        private readonly IQuestionUserLikeWriteRepository _questionUserLikeWriteRepository = questionUserLikeWriteRepository;

        public async Task Handle(DislikeQuestionDto request, CancellationToken cancellationToken)
        {
            var like = 
                await _questionUserLikeWriteRepository.GetAsync(request.QuestionId, _userAccessor.User.Id, cancellationToken) ??
                throw new QuestionAlreadyDislikedException();

            like.Dislike();
            
            await _unitOfWork.CommitAsync(cancellationToken);
        }
    }
}
