using MediatR;
using MySocailApp.Core;

namespace MySocailApp.Application.Queries.SolutionAggregate.GetSolutionUpvotes
{
    public class GetSolutionUpvotesDto(int solutionId, int offset, int take, bool isDescending) : Page(offset,take,isDescending), IRequest<List<SolutionUserVoteResponseDto>>
    {
        public int SolutionId { get; set; } = solutionId;
    }
}
