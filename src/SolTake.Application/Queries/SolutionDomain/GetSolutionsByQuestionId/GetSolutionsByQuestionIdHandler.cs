using MediatR;
using SolTake.Application.InfrastructureServices;
using SolTake.Application.QueryRepositories;

namespace SolTake.Application.Queries.SolutionDomain.GetSolutionsByQuestionId
{
    public class GetSolutionsByQuestionIdHandler(ISolutionQueryRepository repository, IAccessTokenReader accessTokenReader) : IRequestHandler<GetSolutionsByQuestionIdDto, List<SolutionResponseDto>>
    {
        private readonly IAccessTokenReader _accessTokenReader = accessTokenReader;
        private readonly ISolutionQueryRepository _repository = repository;

        public Task<List<SolutionResponseDto>> Handle(GetSolutionsByQuestionIdDto request, CancellationToken cancellationToken)
            => _repository
                .GetSolutionsByQuestionIdAsync(
                    _accessTokenReader.GetRequiredAccountId(),
                    request,
                    request.QuestionId,
                    cancellationToken
                );
    }
}
