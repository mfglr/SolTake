using SolTake.Core.Media;

namespace SolTake.Core.Events
{
    public record MediaUploadedEvent(Guid OwnerId, string ContainerName, string BlobName, MediaType Type);
}
