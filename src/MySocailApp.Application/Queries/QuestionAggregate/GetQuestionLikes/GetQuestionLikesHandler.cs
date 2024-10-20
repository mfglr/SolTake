using MediatR;
using MySocailApp.Application.InfrastructureServices;
using MySocailApp.Application.QueryRepositories;

namespace MySocailApp.Application.Queries.QuestionAggregate.GetQuestionLikes
{
    public class GetQuestionLikesHandler(IQuestionUserLikeQueryRepository repository, IAccessTokenReader accessTokenReader) : IRequestHandler<GetQuestionLikesDto, List<QuestionUserLikeResponseDto>>
    {
        private readonly IQuestionUserLikeQueryRepository _repository = repository;
        private readonly IAccessTokenReader _accessTokenReader = accessTokenReader;

        public Task<List<QuestionUserLikeResponseDto>> Handle(GetQuestionLikesDto request, CancellationToken cancellationToken)
            => _repository
                .GetQuestionLikesAsync(
                    request.QuestionId,
                    _accessTokenReader.GetRequiredAccountId(),
                    request, cancellationToken
                );
    }
}
