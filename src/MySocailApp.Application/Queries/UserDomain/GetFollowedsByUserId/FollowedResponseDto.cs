using MySocailApp.Core;

namespace MySocailApp.Application.Queries.UserDomain.GetFollowedsByUserId
{
    public record FollowedResponseDto(int Id, int FollowedId, string UserName, string? Name, Multimedia? Image, bool IsFollower, bool IsFollowed);
}
