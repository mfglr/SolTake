using MediatR;
using MySocailApp.Application.InfrastructureServices;
using MySocailApp.Domain.QuestionDomain.QuestionUserLikeAggregate.Abstracts;
using MySocailApp.Domain.QuestionDomain.QuestionUserLikeAggregate.Entities;
using MySocailApp.Domain.UserAggregate.Abstracts;

namespace MySocailApp.Application.Commands.QuestionDomain.QuestionUserLikeAggregate.LikeQuestion
{
    public class LikeQuestionHandler(IUnitOfWork unitOfWork, IAccountAccessor accountAccessor, IQuestionUserLikeWriteRepository questionUserLikeWriteRepository, IUserReadRepository userReadRepository) : IRequestHandler<LikeQuestionDto, LikeQuestionCommandResponseDto>
    {
        private readonly IQuestionUserLikeWriteRepository _questionUserLikeWriteRepository = questionUserLikeWriteRepository;
        private readonly IUserReadRepository _userReadRepository = userReadRepository;
        private readonly IAccountAccessor _accountAccessor = accountAccessor;
        private readonly IUnitOfWork _unitOfWork = unitOfWork;

        public async Task<LikeQuestionCommandResponseDto> Handle(LikeQuestionDto request, CancellationToken cancellationToken)
        {
            var like = await _questionUserLikeWriteRepository.GetAsync(request.QuestionId, _accountAccessor.Account.Id, cancellationToken);

            if (like == null)
            {
                like = QuestionUserLike.Create(_accountAccessor.Account.Id);
                await _questionUserLikeWriteRepository.CreateAsync(like, cancellationToken);
            }
            else
            {
                like.Like();
            }
            await _unitOfWork.CommitAsync(cancellationToken);

            var user = await _userReadRepository.GetAsync(_accountAccessor.Account.Id, cancellationToken);

            return new(like, _accountAccessor.Account,user!);
        }
    }
}
