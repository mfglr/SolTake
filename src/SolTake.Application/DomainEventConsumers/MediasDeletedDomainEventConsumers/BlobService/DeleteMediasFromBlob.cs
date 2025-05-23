using SolTake.Application.InfrastructureServices.BlobService;
using SolTake.Core;

namespace SolTake.Application.DomainEventConsumers.MediasDeletedDomainEventConsumers.BlobService
{
    public class DeleteMediasFromBlob(IBlobService blobService) : IDomainEventConsumer<MediasDeletedDomainEvent>
    {
        private readonly IBlobService _blobService = blobService;

        public async Task Handle(MediasDeletedDomainEvent notification, CancellationToken cancellationToken)
        {
            foreach(var media in notification.Medias)
            {
                if(media.MultimediaType == MultimediaType.Video)
                    await _blobService.DeleteAsync(media.ContainerName,media.BlobNameOfFrame!,cancellationToken);
                await _blobService.DeleteAsync(media.ContainerName, media.BlobName, cancellationToken);
            }
        }
    }
}
