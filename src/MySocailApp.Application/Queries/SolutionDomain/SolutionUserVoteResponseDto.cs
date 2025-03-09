using MySocailApp.Core;

namespace MySocailApp.Application.Queries.SolutionDomain
{
    public record SolutionUserVoteResponseDto(int Id, int UserId, string UserName, string? Name, Multimedia? Image);
}
