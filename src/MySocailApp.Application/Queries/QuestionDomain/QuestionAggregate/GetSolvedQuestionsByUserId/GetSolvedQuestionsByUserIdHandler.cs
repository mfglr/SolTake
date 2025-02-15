using MediatR;
using MySocailApp.Application.InfrastructureServices;
using MySocailApp.Application.Queries.QuestionDomain.QuestionAggregate;
using MySocailApp.Application.QueryRepositories;

namespace MySocailApp.Application.Queries.QuestionDomain.QuestionAggregate.GetSolvedQuestionsByUserId
{
    public class GEtSolvedQuestionsByUserIdHandler(IQuestionQueryRepository questionReadRepository, IAccessTokenReader accessTokenReader) : IRequestHandler<GetSolvedQuestionsByUserIdDto, List<QuestionResponseDto>>
    {
        private readonly IAccessTokenReader _accessTokenReader = accessTokenReader;
        private readonly IQuestionQueryRepository _questionReadRepository = questionReadRepository;

        public Task<List<QuestionResponseDto>> Handle(GetSolvedQuestionsByUserIdDto request, CancellationToken cancellationToken)
            => _questionReadRepository.GetSolvedQuestionsByUserIdAsync(_accessTokenReader.GetRequiredAccountId(), request, request.UserId, cancellationToken);
    }
}
