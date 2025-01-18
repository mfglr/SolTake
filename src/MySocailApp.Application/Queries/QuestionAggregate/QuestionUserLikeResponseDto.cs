using MySocailApp.Application.Queries.UserAggregate;

namespace MySocailApp.Application.Queries.QuestionAggregate
{
    public class QuestionUserLikeResponseDto(int id, DateTime createdAt, int questionId, int userId, UserResponseDto? user)
    {
        public int Id { get; private set; } = id;
        public DateTime CreatedAt { get; private set; } = createdAt;
        public int QuestionId { get; private set; } = questionId;
        public int UserId { get; private set; } = userId;
        public UserResponseDto? User { get; private set; } = user;
    };
}
