using MySocailApp.Core;

namespace MySocailApp.Application.Queries.UserDomain.FollowAggregate
{
    public record FollowedResponseDto(int Id, int FollowedId, string UserName, string? Name, Multimedia? Image);
}
