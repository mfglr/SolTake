using MySocailApp.Application.InfrastructureServices.BlobService;
using MySocailApp.Application.InfrastructureServices.BlobService.Objects;
using SolTake.Core;
using SolTake.Domain.MessageAggregate.DomainEvents;

namespace MySocailApp.Application.DomainEventConsumers.MessageDeletedDomainEventConsumers.BlobService
{
    public class DeleteMedias(IBlobService blobService) : IDomainEventConsumer<MessageDeletedDomainEvent>
    {
        private readonly IBlobService _blobService = blobService;
        public async Task Handle(MessageDeletedDomainEvent notification, CancellationToken cancellationToken)
        {
            foreach (var image in notification.Message.Medias)
            {
                await _blobService.DeleteAsync(ContainerName.MessageMedias, image.BlobName, cancellationToken);
                if (image.BlobNameOfFrame != null)
                    await _blobService.DeleteAsync(ContainerName.MessageMedias, image.BlobNameOfFrame, cancellationToken);
            }
        }
    }
}
