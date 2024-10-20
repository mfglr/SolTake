using MediatR;
using MySocailApp.Application.InfrastructureServices;
using MySocailApp.Application.QueryRepositories;

namespace MySocailApp.Application.Queries.SolutionAggregate.GetSolutionDownvotes
{
    public class GetSolutionDownvotedHandler(IAccessTokenReader accessTokenReader, ISolutionUserVoteQueryRepository repository) : IRequestHandler<GetSolutionDownvotesDto, List<SolutionUserVoteResponseDto>>
    {
        private readonly IAccessTokenReader _accessTokenReader = accessTokenReader;
        private readonly ISolutionUserVoteQueryRepository _repository = repository;

        public Task<List<SolutionUserVoteResponseDto>> Handle(GetSolutionDownvotesDto request, CancellationToken cancellationToken)
            => _repository
                .GetSolutionDownvotes(
                    _accessTokenReader.GetRequiredAccountId(),
                    request,
                    request.SolutionId,
                    cancellationToken
                );
    }
}
