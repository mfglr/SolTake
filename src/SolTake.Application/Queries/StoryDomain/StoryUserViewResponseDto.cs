using SolTake.Core;

namespace SolTake.Application.Queries.StoryDomain
{
    public record StoryUserViewResponseDto(int Id, DateTime CreatedAt, int UserId, string UserName, string? Name, Multimedia? Image);
}
