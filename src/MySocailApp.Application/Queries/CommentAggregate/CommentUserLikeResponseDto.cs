using MySocailApp.Application.Queries.UserAggregate;

namespace MySocailApp.Application.Queries.CommentAggregate
{
    public class CommentUserLikeResponseDto
    {
        public int Id { get; private set; }
        public DateTime CreatedAt { get; private set; }
        public int CommentId { get; private set; }
        public int AppUserId { get; private set; }
        public UserResponseDto? AppUser { get; private set; }

        public CommentUserLikeResponseDto(int id, DateTime createdAt, int commentId, int appUserId, UserResponseDto? appUser)
        {
            Id = id;
            CreatedAt = createdAt;
            CommentId = commentId;
            AppUserId = appUserId;
            AppUser = appUser;
        }

        public CommentUserLikeResponseDto() { }
    }
}
