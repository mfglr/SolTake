using MediatR;
using SolTake.Application.InfrastructureServices;
using SolTake.Application.QueryRepositories;

namespace MySocailApp.Application.Queries.SolutionDomain.GetSavedSolutions
{
    public class GetSolutionUserSavesHandler(ISolutionUserSaveQueryRepository solutionUserSaveQueryRepository, IAccessTokenReader accessTokenReader) : IRequestHandler<GetSolutionUserSavesDto, List<SolutionUserSaveResponseDto>>
    {
        private readonly ISolutionUserSaveQueryRepository _solutionUserSaveQueryRepository = solutionUserSaveQueryRepository;
        private readonly IAccessTokenReader _accessTokenReader = accessTokenReader;

        public Task<List<SolutionUserSaveResponseDto>> Handle(GetSolutionUserSavesDto request, CancellationToken cancellationToken)
            => _solutionUserSaveQueryRepository
                .GetSolutionUserSaves(
                    _accessTokenReader.GetRequiredAccountId(),
                    _accessTokenReader.GetRequiredAccountId(),
                    request,
                    cancellationToken
                );
    }
}
