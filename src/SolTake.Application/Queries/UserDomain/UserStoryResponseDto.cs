using SolTake.Core;

namespace SolTake.Application.Queries.UserDomain
{
    public record UserStoryResponseDto(int Id,DateTime CreatedAt, bool IsViewed, Multimedia Media);
}
