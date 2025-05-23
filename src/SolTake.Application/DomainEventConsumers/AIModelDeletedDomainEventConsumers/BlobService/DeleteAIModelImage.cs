using SolTake.Application.InfrastructureServices.BlobService;
using SolTake.Core;
using SolTake.Domain.AIModelAggregate.DomainEvents;

namespace SolTake.Application.DomainEventConsumers.AIModelDeletedDomainEventConsumers.BlobService
{
    public class DeleteAIModelImage(IBlobService blobService) : IDomainEventConsumer<AIModelDeletedDomainEvent>
    {
        private readonly IBlobService _blobService = blobService;

        public Task Handle(AIModelDeletedDomainEvent notification, CancellationToken cancellationToken)
            => _blobService.DeleteAsync(notification.AIModel.Image.ContainerName, notification.AIModel.Image.BlobName, cancellationToken);
    }
}
