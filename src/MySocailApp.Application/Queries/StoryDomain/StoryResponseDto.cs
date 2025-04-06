using MySocailApp.Core;

namespace MySocailApp.Application.Queries.StoryDomain
{
    public record StoryResponseDto(int Id, DateTime CreatedAt, bool IsViewed, int UserId, string UserName, Multimedia? Image, Multimedia Media);
}
