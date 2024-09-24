using MediatR;
using MySocailApp.Application.ApplicationServices;
using MySocailApp.Application.QueryRepositories;

namespace MySocailApp.Application.Queries.SolutionAggregate.GetSavedSolutions
{
    public class GetSavedSolutionsHandler(ISolutionUserSaveQueryRepository solutionUserSaveQueryRepository, IAccessTokenReader accessTokenReader) : IRequestHandler<GetSavedSolutionsDto, List<SolutionUserSaveResponseDto>>
    {
        private readonly ISolutionUserSaveQueryRepository _solutionUserSaveQueryRepository = solutionUserSaveQueryRepository;
        private readonly IAccessTokenReader _accessTokenReader = accessTokenReader;

        public Task<List<SolutionUserSaveResponseDto>> Handle(GetSavedSolutionsDto request, CancellationToken cancellationToken)
            => _solutionUserSaveQueryRepository
                .GetSavedSolutions(
                    _accessTokenReader.GetRequiredAccountId(),
                    _accessTokenReader.GetRequiredAccountId(),
                    request,
                    cancellationToken
                );
    }
}
