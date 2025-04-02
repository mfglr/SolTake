using MySocailApp.Application.InfrastructureServices.BlobService;
using MySocailApp.Core;

namespace MySocailApp.Application.DomainEventConsumers.MediasDeletedDomainEventConsumers.BlobService
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
