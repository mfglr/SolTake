using SolTake.Core;

namespace SolTake.Application.Queries.UserDomain
{
    public record UserResponseDto(int Id, DateTime CreatedAt, DateTime? UpdatedAt, string UserName, string? Name, string? Biography, int NumberOfQuestions, int NumberOfFollowers, int NumberOfFolloweds, bool IsFollower, bool IsFollowed, Multimedia? Image, IEnumerable<UserStoryResponseDto> Stories);
}
