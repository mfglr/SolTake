using MySocailApp.Core;

namespace MySocailApp.Application.Queries.UserDomain
{
    public record UserUserSearchResponseDto(int Id, int UserId, string UserName, string? Name, Multimedia? Image);
}
