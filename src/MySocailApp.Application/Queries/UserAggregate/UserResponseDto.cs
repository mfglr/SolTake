using MySocailApp.Domain.AppUserAggregate;

namespace MySocailApp.Application.Queries.UserAggregate
{
    public record UserResponseDto(
        string Id,
        DateTime CreatedAt,
        DateTime? UpdatedAt,
        string UserName,
        Gender Gender,
        DateTime? BirthDate,
        string Name,
        ProfileVisibility ProfileVisibility
    )
    {
        public int numberOfFollowers { get; set; }
        public int numberOfFolloweds { get; set; }
    };
}
