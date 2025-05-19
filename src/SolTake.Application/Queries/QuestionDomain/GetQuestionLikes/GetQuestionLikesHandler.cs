using MediatR;
using MySocailApp.Application.QueryRepositories;

namespace MySocailApp.Application.Queries.QuestionDomain.GetQuestionLikes
{
    public class GetQuestionLikesHandler(IQuestionUserLikeQueryRepository repository) : IRequestHandler<GetQuestionLikesDto, List<QuestionUserLikeResponseDto>>
    {
        private readonly IQuestionUserLikeQueryRepository _repository = repository;

        public Task<List<QuestionUserLikeResponseDto>> Handle(GetQuestionLikesDto request, CancellationToken cancellationToken)
            => _repository.GetLikesAsync(request.QuestionId, request, cancellationToken);
    }
}
