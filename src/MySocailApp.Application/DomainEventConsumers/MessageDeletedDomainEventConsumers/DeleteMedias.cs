using MySocailApp.Application.InfrastructureServices.BlobService;
using MySocailApp.Application.InfrastructureServices.BlobService.Objects;
using MySocailApp.Core;
using MySocailApp.Domain.MessageDomain.MessageAggregate.DomainEvents;

namespace MySocailApp.Application.DomainEventConsumers.MessageDeletedDomainEventConsumers
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
