using MySocailApp.Application.InfrastructureServices.BlobService;
using MySocailApp.Core;
using MySocailApp.Domain.AIModelAggregate.DomainEvents;

namespace MySocailApp.Application.DomainEventConsumers.AIModelImageDeletedDomainEventConsumers.BlobService
{
    public class DeleteImage(IBlobService blobService) : IDomainEventConsumer<AIModelImageDeletedDomainEvent>
    {
        private readonly IBlobService _blobService = blobService;

        public Task Handle(AIModelImageDeletedDomainEvent notification, CancellationToken cancellationToken)
            => _blobService.DeleteAsync(notification.Image.ContainerName,notification.Image.BlobName,cancellationToken);
    }
}
