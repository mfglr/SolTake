using MediatR;
using SolTake.Core;

namespace SolTake.Application.Queries.SolutionDomain.GetSolutionDownvotes
{
    public record GetSolutionDownvotesDto(int SolutionId, int? Offset, int Take, bool IsDescending) : Page(Offset, Take, IsDescending), IRequest<List<SolutionUserVoteResponseDto>>;
}
