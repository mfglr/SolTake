using SolTake.Core.Media;

namespace SolTake.NsfwDetector.Application.ApplicationServices.CalculateMediaNsfwScore
{
    public record CalculateMediaNsfwScoreDto(Guid OwnerId, string ContainerName, string BlobName, MediaType Type);
}
