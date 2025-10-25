using SolTake.Core.Media;

namespace SolTake.Core.Events.QuestionEvents
{
    public record Media_QuestionCreated(string ContainerName, string BlobName, MediaType Type);
    public record QuestionCreated(
        Guid Id,
        string ExamName,
        string? Content,
        IEnumerable<string> TopicNames,
        IEnumerable<Media_QuestionCreated> Media
    );
}
