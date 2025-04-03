using MySocailApp.Core;

namespace MySocailApp.Application.Queries.StoryDomain
{
    public record StoryResponseDto(int Id, int UserId, string UserName, Multimedia? Image, Multimedia Media);
}
