using SolTake.Application.InfrastructureServices.BlobService;
using SolTake.Core;
using SolTake.Domain.AIModelAggregate.DomainEvents;

namespace SolTake.Application.DomainEventConsumers.AIModelImageDeletedDomainEventConsumers.BlobService
{
    public class DeleteImage(IBlobService blobService) : IDomainEventConsumer<AIModelImageDeletedDomainEvent>
    {
        private readonly IBlobService _blobService = blobService;

        public Task Handle(AIModelImageDeletedDomainEvent notification, CancellationToken cancellationToken)
            => _blobService.DeleteAsync(notification.Image.ContainerName,notification.Image.BlobName,cancellationToken);
    }
}
