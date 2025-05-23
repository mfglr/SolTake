using MediatR;
using SolTake.Application.InfrastructureServices;
using SolTake.Application.QueryRepositories;

namespace SolTake.Application.Queries.QuestionDomain.GetUnsolvedQuestionsByUserId
{
    public class GetUnsolvedQuestionsByUserIdHandler(IQuestionQueryRepository questionQueryRepository, IAccessTokenReader accessTokenReader) : IRequestHandler<GetUnsolvedQuestionsByUserIdDto, List<QuestionResponseDto>>
    {
        private readonly IQuestionQueryRepository _questionQueryRepository = questionQueryRepository;
        private readonly IAccessTokenReader _accessTokenReader = accessTokenReader;

        public Task<List<QuestionResponseDto>> Handle(GetUnsolvedQuestionsByUserIdDto request, CancellationToken cancellationToken)
            => _questionQueryRepository
                .GetUnsolvedQuestionsByUserIdAsync(
                    _accessTokenReader.GetRequiredAccountId(),
                    request,
                    request.UserId,
                    cancellationToken
                );
    }
}
