using MediatR;
using MySocailApp.Core;

namespace MySocailApp.Application.Queries.SolutionAggregate.GetSolutionDownvotes
{
    public class GetSolutionDownvotesDto(int solutionId, int? offset, int take, bool isDescending) : Page(offset,take,isDescending), IRequest<List<SolutionUserVoteResponseDto>>
    {
        public int SolutionId { get; private set; } = solutionId;
    }
}
