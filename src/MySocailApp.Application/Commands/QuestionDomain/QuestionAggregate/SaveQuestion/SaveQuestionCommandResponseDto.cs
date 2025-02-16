namespace MySocailApp.Application.Commands.QuestionDomain.QuestionAggregate.SaveQuestion
{
    public class SaveQuestionCommandResponseDto
    {
        public int Id { get; private set; }
        public DateTime CreatedAt { get; private set; }
        public int UserId { get; private set; }
        public int QuestionId { get; private set; }
        private SaveQuestionCommandResponseDto() { }
    }
}
