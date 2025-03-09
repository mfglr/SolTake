using MySocailApp.Application.Queries.UserDomain;
using MySocailApp.Domain.SolutionDomain.SolutionAggregate.ValueObjects;

namespace MySocailApp.Application.Queries.SolutionDomain
{
    public record SolutionUserVoteResponseDto(int Id, DateTime CreatedAt, int SolutionId, int UserId, SolutionVoteType Type, UserResponseDto AppUser);
}
