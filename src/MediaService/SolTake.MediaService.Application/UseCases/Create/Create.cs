using SolTake.Core.Media;

namespace SolTake.MediaService.Application.UseCases.Create
{
    public record Media_Create(Guid OwnerId, MediaType Type, string ContainerName, string BlobName);
    public record Create(IEnumerable<Media_Create> Media);
}
