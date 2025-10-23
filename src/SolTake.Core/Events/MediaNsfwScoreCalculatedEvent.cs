using SolTake.Core.Media;

namespace SolTake.Core.Events
{
    public record MediaNsfwScoreCalculatedEvent(Guid OwnerId, string ContainerName, string BlobName, IEnumerable<NsfwScore> Scores);
}
