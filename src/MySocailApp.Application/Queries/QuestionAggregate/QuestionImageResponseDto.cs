namespace MySocailApp.Application.Queries.QuestionAggregate
{
    public record QuestionImageResponseDto(int Id, int QuestionId, string BlobName, double Height, double Width);
}
