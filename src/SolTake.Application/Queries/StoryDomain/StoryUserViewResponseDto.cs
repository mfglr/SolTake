using SolTake.Core;

namespace MySocailApp.Application.Queries.StoryDomain
{
    public record StoryUserViewResponseDto(int Id, DateTime CreatedAt, int UserId, string UserName, string? Name, Multimedia? Image);
}
