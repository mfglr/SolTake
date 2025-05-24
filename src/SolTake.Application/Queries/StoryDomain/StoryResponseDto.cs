using SolTake.Core;

namespace SolTake.Application.Queries.StoryDomain
{
    public record StoryResponseDto(int Id, DateTime CreatedAt, bool IsViewed, int UserId, string UserName, Multimedia? Image, Multimedia Media, int NumberOfViewers);
}
