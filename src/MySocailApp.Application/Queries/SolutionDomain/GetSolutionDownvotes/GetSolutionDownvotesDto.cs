using MediatR;
using MySocailApp.Core;

namespace MySocailApp.Application.Queries.SolutionDomain.GetSolutionDownvotes
{
    public record GetSolutionDownvotesDto(int SolutionId, int? Offset, int Take, bool IsDescending) : Page(Offset, Take, IsDescending), IRequest<List<SolutionUserVoteResponseDto>>;
}
