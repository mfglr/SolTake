namespace MySocailApp.Application.Commands.QuestionDomain.QuestionUserLikeAggregate.LikeQuestion
{
    public class LikeQuestionCommandResponseDto
    {
        public int Id { get; private set; }
        public DateTime CreatedAt { get; private set; }
        public int QuestionId { get; private set; }
        public int UserId { get; private set; }
    }
}
