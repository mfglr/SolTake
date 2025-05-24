using SolTake.Core;

namespace SolTake.Application.Queries.UserDomain
{
    public record UserUserSearchResponseDto(int Id, int UserId, string UserName, string? Name, Multimedia? Image);
}
