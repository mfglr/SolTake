using MySocailApp.Core;

namespace MySocailApp.Application.Queries.UserDomain.FollowAggregate
{
    public record FollowerResponseDto(int Id, int FollowerId, string UserName, string? Name, Multimedia? Image);
}
