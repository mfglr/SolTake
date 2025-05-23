using MediatR;
using SolTake.Application.InfrastructureServices;
using SolTake.Application.QueryRepositories;

namespace MySocailApp.Application.Queries.SolutionDomain.GetVideoSolutions
{
    public class GetVideoSolutionsHandler(ISolutionQueryRepository solutionQueryRepository, IAccessTokenReader accessTokenReader) : IRequestHandler<GetVideoSolutionsDto, List<SolutionResponseDto>>
    {
        private readonly ISolutionQueryRepository _solutionQueryRepository = solutionQueryRepository;
        private readonly IAccessTokenReader _accessTokenReader = accessTokenReader;

        public Task<List<SolutionResponseDto>> Handle(GetVideoSolutionsDto request, CancellationToken cancellationToken)
            => _solutionQueryRepository
                .GetVideoSolutions(
                    _accessTokenReader.GetRequiredAccountId(),
                    request,
                    request.QuestionId,
                    cancellationToken
                );
    }
}
