using MySocailApp.Domain.AppUserAggregate.ValueObjects;

namespace MySocailApp.Application.Queries.UserAggregate
{
    public record AppUserResponseDto(int Id, DateTime CreatedAt, DateTime? UpdatedAt, string UserName, string? Name, DateTime? BirthDate, Gender Gender, bool HasImage, int NumberOfQuestions, int NumberOfFollowers, int NumberOfFolloweds, bool IsFollower, bool IsFollowed);
}
