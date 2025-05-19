using SolTake.Core;

namespace MySocailApp.Application.Queries.UserDomain.GetFollowedsByUserId
{
    public record FollowResponseDto(int Id, int UserId, string UserName, string? Name, Multimedia? Image, bool IsFollower, bool IsFollowed);
}
