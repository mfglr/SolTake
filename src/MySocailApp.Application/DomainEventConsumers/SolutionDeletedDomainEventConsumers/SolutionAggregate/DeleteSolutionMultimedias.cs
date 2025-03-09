using MySocailApp.Application.InfrastructureServices.BlobService;
using MySocailApp.Application.InfrastructureServices.BlobService.Objects;
using MySocailApp.Core;
using MySocailApp.Domain.SolutionDomain.SolutionAggregate.DomainEvents;

namespace MySocailApp.Application.DomainEventConsumers.SolutionDeletedDomainEventConsumers.SolutionAggregate
{
    public class DeleteSolutionMultimedias(IBlobService blobService) : IDomainEventConsumer<SolutionDeletedDomainEvent>
    {
        private readonly IBlobService _blobService = blobService;

        public async Task Handle(SolutionDeletedDomainEvent notification, CancellationToken cancellationToken)
        {
            foreach(var media in notification.Solution.Medias)
                await _blobService.DeleteAsync(ContainerName.SolutionMedias, media.BlobName, cancellationToken);
        }
    }
}
