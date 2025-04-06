using MySocailApp.Core;

namespace MySocailApp.Application.Queries.StoryDomain
{
    public record StoryUserViewResponseDto(int Id, DateTime CreatedAt, int UserId, string UserName, Multimedia? Image);
}
