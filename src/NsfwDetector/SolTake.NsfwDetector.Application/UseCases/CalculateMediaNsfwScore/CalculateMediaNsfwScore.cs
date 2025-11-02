using SolTake.Core.Media;

namespace SolTake.NsfwDetector.Application.UseCases.CalculateMediaNsfwScore
{
    public record CalculateMediaNsfwScore(Guid Id, MediaType Type, string ContainerName, string BlobName);
}
