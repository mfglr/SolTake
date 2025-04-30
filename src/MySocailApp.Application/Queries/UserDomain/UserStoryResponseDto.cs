using MySocailApp.Core;

namespace MySocailApp.Application.Queries.UserDomain
{
    public record UserStoryResponseDto(int Id,DateTime CreatedAt, bool IsViewed, Multimedia Media);
}
