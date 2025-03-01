using MySocailApp.Application.Queries.UserDomain.UserAggregate;

namespace MySocailApp.Application.Queries.CommentAggregate
{
    public class CommentUserLikeResponseDto
    {
        public int Id { get; private set; }
        public DateTime CreatedAt { get; private set; }
        public int CommentId { get; private set; }
        public int UserId { get; private set; }
        public UserResponseDto? User { get; private set; }

        public CommentUserLikeResponseDto(int id, DateTime createdAt, int commentId, int userId, UserResponseDto? user)
        {
            Id = id;
            CreatedAt = createdAt;
            CommentId = commentId;
            UserId = userId;
            User = user;
        }

        public CommentUserLikeResponseDto() { }
    }
}
