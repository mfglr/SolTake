using MediatR;
using MySocailApp.Application.Queries.SolutionDomain;
using MySocailApp.Core;

namespace MySocailApp.Application.Queries.SolutionDomain.GetSolutionDownvotes
{
    public class GetSolutionDownvotesDto(int solutionId, int? offset, int take, bool isDescending) : Page(offset, take, isDescending), IRequest<List<SolutionUserVoteResponseDto>>
    {
        public int SolutionId { get; private set; } = solutionId;
    }
}
