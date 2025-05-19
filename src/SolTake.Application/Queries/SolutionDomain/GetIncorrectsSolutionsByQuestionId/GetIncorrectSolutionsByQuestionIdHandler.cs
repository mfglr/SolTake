using MediatR;
using MySocailApp.Application.InfrastructureServices;
using MySocailApp.Application.Queries.SolutionDomain;
using MySocailApp.Application.QueryRepositories;

namespace MySocailApp.Application.Queries.SolutionDomain.GetIncorrectsSolutionsByQuestionId
{
    public class GetIncorrectSolutionsByQuestionIdHandler(ISolutionQueryRepository solutionQueryRepository, IAccessTokenReader accessTokenReader) : IRequestHandler<GetIncorrectSolutionsByQuestionIdDto, List<SolutionResponseDto>>
    {
        private readonly IAccessTokenReader _accessTokenReader = accessTokenReader;
        private readonly ISolutionQueryRepository _solutionQueryRepository = solutionQueryRepository;

        public Task<List<SolutionResponseDto>> Handle(GetIncorrectSolutionsByQuestionIdDto request, CancellationToken cancellationToken)
            => _solutionQueryRepository
                .GetIncorrectSolutionsByQuestionId(
                    _accessTokenReader.GetRequiredAccountId(),
                    request,
                    request.QuestionId,
                    cancellationToken
                );
    }
}
