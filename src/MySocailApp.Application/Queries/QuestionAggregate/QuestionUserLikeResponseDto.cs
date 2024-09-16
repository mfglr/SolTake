using MySocailApp.Application.Queries.UserAggregate;

namespace MySocailApp.Application.Queries.QuestionAggregate
{
    public class QuestionUserLikeResponseDto
    {
        public int Id { get; private set; }
        public DateTime CreatedAt { get; private set; }
        public int QuestionId { get; private set; }
        public int AppUserId { get; private set; }
        public AppUserResponseDto? AppUser { get; private set; }

        public QuestionUserLikeResponseDto(int id, DateTime createdAt, int questionId, int appUserId, AppUserResponseDto? appUser)
        {
            Id = id;
            CreatedAt = createdAt;
            QuestionId = questionId;
            AppUserId = appUserId;
            AppUser = appUser;
        }
    };
}
