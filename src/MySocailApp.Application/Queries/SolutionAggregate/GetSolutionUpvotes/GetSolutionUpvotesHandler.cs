using MediatR;
using MySocailApp.Application.ApplicationServices;
using MySocailApp.Application.QueryRepositories;

namespace MySocailApp.Application.Queries.SolutionAggregate.GetSolutionUpvotes
{
    public class GetSolutionUpvotesHandler(ISolutionUserVoteQueryRepository repository, IAccessTokenReader accessTokenReader) : IRequestHandler<GetSolutionUpvotesDto, List<SolutionUserVoteResponseDto>>
    {
        private readonly ISolutionUserVoteQueryRepository _repository = repository;
        private readonly IAccessTokenReader _accessTokenReader = accessTokenReader;

        public Task<List<SolutionUserVoteResponseDto>> Handle(GetSolutionUpvotesDto request, CancellationToken cancellationToken)
            => _repository
                .GetSolutionUpvotes(
                    _accessTokenReader.GetRequiredAccountId(),
                    request,
                    request.SolutionId,
                    cancellationToken
                );
    }
}
