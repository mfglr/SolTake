using MediatR;
using MySocailApp.Application.InfrastructureServices;
using MySocailApp.Application.Queries.SolutionDomain;
using MySocailApp.Application.QueryRepositories;

namespace MySocailApp.Application.Queries.SolutionDomain.GetCorrectSolutionsByQuestionId
{
    public class GetCorrectSolutionsByQuestionIdHandler(ISolutionQueryRepository solutionReadRepsository, IAccessTokenReader accessTokenReader) : IRequestHandler<GetCorrectSolutionsByQuestionIdDto, List<SolutionResponseDto>>
    {
        private readonly IAccessTokenReader _accessTokenReader = accessTokenReader;
        private readonly ISolutionQueryRepository _solutionReadRepsository = solutionReadRepsository;

        public Task<List<SolutionResponseDto>> Handle(GetCorrectSolutionsByQuestionIdDto request, CancellationToken cancellationToken)
            => _solutionReadRepsository.GetCorrectSolutionsByQuestionId(
                    _accessTokenReader.GetRequiredAccountId(),
                    request,
                    request.QuestionId,
                    cancellationToken
               );
    }
}
