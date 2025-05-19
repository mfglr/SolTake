using MediatR;
using MySocailApp.Application.InfrastructureServices;
using MySocailApp.Application.Queries.SolutionDomain;
using MySocailApp.Application.QueryRepositories;

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
