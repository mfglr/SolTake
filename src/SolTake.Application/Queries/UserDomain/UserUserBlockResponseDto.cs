using SolTake.Core;

namespace MySocailApp.Application.Queries.UserDomain
{
    public record UserUserBlockResponseDto(int Id, int UserId, string UserName, string? Name, Multimedia? Image);
}