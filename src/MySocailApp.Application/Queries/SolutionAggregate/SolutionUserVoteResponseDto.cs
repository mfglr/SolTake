using MySocailApp.Application.Queries.UserAggregate;
using MySocailApp.Domain.SolutionAggregate.ValueObjects;

namespace MySocailApp.Application.Queries.SolutionAggregate
{
    public record SolutionUserVoteResponseDto(int Id, DateTime CreatedAt, int SolutionId, int AppUserId, SolutionVoteType Type,AppUserResponseDto AppUser);
}
