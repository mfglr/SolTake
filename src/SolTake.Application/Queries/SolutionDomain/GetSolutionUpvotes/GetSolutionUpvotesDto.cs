using MediatR;
using SolTake.Core;

namespace MySocailApp.Application.Queries.SolutionDomain.GetSolutionUpvotes
{
    public record GetSolutionUpvotesDto(int SolutionId, int? Offset, int Take, bool IsDescending) : Page(Offset, Take, IsDescending), IRequest<List<SolutionUserVoteResponseDto>>;
}
