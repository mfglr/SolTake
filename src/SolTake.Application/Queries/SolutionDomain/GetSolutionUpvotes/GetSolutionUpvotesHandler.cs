using MediatR;
using SolTake.Application.QueryRepositories;

namespace SolTake.Application.Queries.SolutionDomain.GetSolutionUpvotes
{
    public class GetSolutionUpvotesHandler(ISolutionUserVoteQueryRepository repository) : IRequestHandler<GetSolutionUpvotesDto, List<SolutionUserVoteResponseDto>>
    {
        private readonly ISolutionUserVoteQueryRepository _repository = repository;

        public Task<List<SolutionUserVoteResponseDto>> Handle(GetSolutionUpvotesDto request, CancellationToken cancellationToken)
            => _repository
                .GetSolutionUpvotes(
                    request,
                    request.SolutionId,
                    cancellationToken
                );
    }
}
