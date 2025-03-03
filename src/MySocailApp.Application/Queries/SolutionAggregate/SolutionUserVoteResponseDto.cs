using MySocailApp.Application.Queries.UserDomain;
using MySocailApp.Domain.SolutionAggregate.ValueObjects;

namespace MySocailApp.Application.Queries.SolutionAggregate
{
    public record SolutionUserVoteResponseDto(int Id, DateTime CreatedAt, int SolutionId, int UserId, SolutionVoteType Type,UserResponseDto AppUser);
}
