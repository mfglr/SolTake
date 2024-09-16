using MySocailApp.Application.Queries.UserAggregate;

namespace MySocailApp.Application.Queries.QuestionAggregate
{
    public class QuestionUserLikeResponseDto(int id, DateTime createdAt, int questionId, int appUserId, AppUserResponseDto? appUser)
    {
        public int Id { get; private set; } = id;
        public DateTime CreatedAt { get; private set; } = createdAt;
        public int QuestionId { get; private set; } = questionId;
        public int AppUserId { get; private set; } = appUserId;
        public AppUserResponseDto? AppUser { get; private set; } = appUser;
    };
}
