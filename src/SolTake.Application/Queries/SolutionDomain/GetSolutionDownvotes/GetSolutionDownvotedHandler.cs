using MediatR;
using SolTake.Application.QueryRepositories;

namespace MySocailApp.Application.Queries.SolutionDomain.GetSolutionDownvotes
{
    public class GetSolutionDownvotedHandler(ISolutionUserVoteQueryRepository repository) : IRequestHandler<GetSolutionDownvotesDto, List<SolutionUserVoteResponseDto>>
    {
        private readonly ISolutionUserVoteQueryRepository _repository = repository;

        public Task<List<SolutionUserVoteResponseDto>> Handle(GetSolutionDownvotesDto request, CancellationToken cancellationToken)
            => _repository
                .GetSolutionDownvotes(
                    request,
                    request.SolutionId,
                    cancellationToken
                );
    }
}
