using MySocailApp.Core;

namespace MySocailApp.Application.Queries.UserDomain.GetUsersSearched
{
    public record UserSearchedResponseDto(int Id, int SearchedId, string UserName, string? Name, Multimedia? Image);
}
