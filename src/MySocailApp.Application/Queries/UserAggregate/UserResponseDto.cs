using MySocailApp.Core;

namespace MySocailApp.Application.Queries.UserAggregate
{
    public record UserResponseDto(int Id, DateTime CreatedAt, DateTime? UpdatedAt, string UserName, string? Name, string? Biography, bool HasImage, int NumberOfQuestions, int NumberOfFollowers, int NumberOfFolloweds, bool IsFollower, bool IsFollowed) : IHasId;
}
