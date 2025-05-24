using SolTake.Core;

namespace SolTake.Application.Queries.SolutionDomain
{
    public record SolutionUserVoteResponseDto(int Id, int UserId, string UserName, string? Name, Multimedia? Image);
}
