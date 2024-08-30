namespace MySocailApp.Application.Queries.QuestionAggregate
{
    public record QuestionImageResponseDto(int Id, int QuestionId, string BlobName, float Height, float Width);
}
