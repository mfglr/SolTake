using SolTake.Core.Media;

namespace SolTake.Core.Events.MediaEvents
{
    public record MediaCreated(Guid Id, Guid OwnerId, MediaType Type, string ContainerName, string BlobName);
}
