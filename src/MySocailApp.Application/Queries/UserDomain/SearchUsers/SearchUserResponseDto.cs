using MySocailApp.Core;

namespace MySocailApp.Application.Queries.UserDomain.SearchUsers
{
    public record SearchUserResponseDto(int Id, string UserName, string? Name, Multimedia? Image);
}
