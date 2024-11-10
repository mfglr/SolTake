using MySocailApp.Application.InfrastructureServices.BlobService;
using MySocailApp.Application.InfrastructureServices.BlobService.Objects;
using MySocailApp.Core;
using MySocailApp.Domain.SolutionAggregate.DomainEvents;

namespace MySocailApp.Application.DomainEventConsumers.SolutionDeletedDomainEventConsumers.SolutionAggregate
{
    public class DeleteSolutionVideo(IBlobService blobService) : IDomainEventConsumer<SolutionDeletedDomainEvent>
    {
        private readonly IBlobService _blobService = blobService;

        public async Task Handle(SolutionDeletedDomainEvent notification, CancellationToken cancellationToken)
        {
            if (notification.Solution.HasVideo)
                await _blobService.DeleteAsync(ContainerName.SolutionVideos, notification.Solution.Video!.BlobName, cancellationToken);
        }
    }
}
