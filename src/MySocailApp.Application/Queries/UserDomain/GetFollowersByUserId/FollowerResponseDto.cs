using MySocailApp.Core;

namespace MySocailApp.Application.Queries.UserDomain.GetFollowersByUserId
{
    public record FollowerResponseDto(int Id, int FollowerId, string UserName, string? Name, Multimedia? Image, bool IsFollower, bool IsFollowed);
}
