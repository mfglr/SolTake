using SolTake.Core;

namespace SolTake.Application.Queries.UserDomain.SearchUsers
{
    public record SearchUserResponseDto(int Id, string UserName, string? Name, Multimedia? Image);
}
