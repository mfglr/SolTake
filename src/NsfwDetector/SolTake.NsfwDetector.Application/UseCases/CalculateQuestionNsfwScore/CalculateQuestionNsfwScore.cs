using SolTake.Core.Media;

namespace SolTake.NsfwDetector.Application.UseCases.CalculateQuestionNsfwScore
{
    public record Media_CalculateQuestionNsfwScore(string ContainerName, string BlobName, MediaType Type);
    public record CalculateQuestionNsfwScore(Guid Id, string? Content, IEnumerable<string> TopicNames, IEnumerable<Media_CalculateQuestionNsfwScore> Media);
}
