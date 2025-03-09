using MediatR;
using MySocailApp.Application.InfrastructureServices;
using MySocailApp.Application.Queries.SolutionDomain;
using MySocailApp.Application.QueryRepositories;

namespace MySocailApp.Application.Queries.SolutionDomain.GetPendingSolutionsByQuestionId
{
    public class GetPendingSolutionsByQuestionIdHandler(ISolutionQueryRepository solutionQueryRepository, IAccessTokenReader accessTokenReader) : IRequestHandler<GetPendingSolutionsByQuestionIdDto, List<SolutionResponseDto>>
    {
        private readonly IAccessTokenReader _accessTokenReader = accessTokenReader;
        private readonly ISolutionQueryRepository _solutionQueryRepository = solutionQueryRepository;

        public Task<List<SolutionResponseDto>> Handle(GetPendingSolutionsByQuestionIdDto request, CancellationToken cancellationToken)
            => _solutionQueryRepository
                .GetPendingSolutionsByQuestionId(
                    _accessTokenReader.GetRequiredAccountId(),
                    request,
                    request.QuestionId,
                    cancellationToken
                );
    }
}
