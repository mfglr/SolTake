using MySocailApp.Application.InfrastructureServices.BlobService;
using MySocailApp.Application.InfrastructureServices.BlobService.Objects;
using MySocailApp.Core;
using MySocailApp.Domain.MessageAggregate.DomainEvents;

namespace MySocailApp.Application.DomainEventConsumers.MessageAggregate.MessageDeletedDomainEventConsumers
{
    public class DeleteImages(IBlobService blobService) : IDomainEventConsumer<MessageDeletedDomainEvent>
    {
        private readonly IBlobService _blobService = blobService;
        public async Task Handle(MessageDeletedDomainEvent notification, CancellationToken cancellationToken)
        {
            foreach (var image in notification.message.Images)
                await _blobService.DeleteAsync(ContainerName.MesssageImages, image.BlobName, cancellationToken);
        }
    }
}
