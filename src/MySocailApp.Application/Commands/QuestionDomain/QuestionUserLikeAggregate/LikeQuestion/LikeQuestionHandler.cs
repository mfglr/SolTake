using MediatR;
using MySocailApp.Application.InfrastructureServices;
using MySocailApp.Domain.QuestionDomain.QuestionUserLikeAggregate.Abstracts;
using MySocailApp.Domain.QuestionDomain.QuestionUserLikeAggregate.Entities;

namespace MySocailApp.Application.Commands.QuestionDomain.QuestionUserLikeAggregate.LikeQuestion
{
    public class LikeQuestionHandler(IUnitOfWork unitOfWork, IUserAccessor userAccessor, IQuestionUserLikeWriteRepository questionUserLikeWriteRepository) : IRequestHandler<LikeQuestionDto, LikeQuestionCommandResponseDto>
    {
        private readonly IQuestionUserLikeWriteRepository _questionUserLikeWriteRepository = questionUserLikeWriteRepository;
        private readonly IUserAccessor _userAccessor = userAccessor;
        private readonly IUnitOfWork _unitOfWork = unitOfWork;

        public async Task<LikeQuestionCommandResponseDto> Handle(LikeQuestionDto request, CancellationToken cancellationToken)
        {
            var like = await _questionUserLikeWriteRepository.GetAsync(request.QuestionId, _userAccessor.User.Id, cancellationToken);

            if (like == null)
            {
                like = QuestionUserLike.Create(_userAccessor.User.Id);
                await _questionUserLikeWriteRepository.CreateAsync(like, cancellationToken);
            }
            else
            {
                like.Like();
            }
            await _unitOfWork.CommitAsync(cancellationToken);

            return new(like, _userAccessor.User);
        }
    }
}
