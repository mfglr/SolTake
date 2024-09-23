using MySocailApp.Application.ApplicationServices.BlobService;
using MySocailApp.Core;
using MySocailApp.Domain.SolutionAggregate.DomainEvents;

namespace MySocailApp.Application.DomainEventConsumers.SolutionDeletedDomainEventConsumers
{
    public class DeleteImages(IBlobService blobService) : IDomainEventConsumer<SolutionDeletedDomainEvent>
    {
        private readonly IBlobService _blobService = blobService;

        public Task Handle(SolutionDeletedDomainEvent notification, CancellationToken cancellationToken)
        {
            _blobService.DeleteRange(ContainerName.SolutionImages, notification.Solution.Images.Select(x => x.BlobName));
            return Task.CompletedTask;
        }
    }
}
