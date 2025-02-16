namespace MySocailApp.Application.Queries.QuestionDomain.QuestionAggregate
{
    public record QuestionUserSaveResponseDto(int Id, DateTime CreatedAt, int QuestionId, int UserId, QuestionResponseDto Question);
}
