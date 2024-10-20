using MySocailApp.Application.InfrastructureServices.BlobService.ImageServices;
using MySocailApp.Application.InfrastructureServices.BlobService.Objects;
using MySocailApp.Core;
using MySocailApp.Domain.SolutionAggregate.DomainEvents;

namespace MySocailApp.Application.DomainEventConsumers.SolutionDeletedDomainEventConsumers.SolutionAggregate
{
    public class DeleteSolutionImages(IImageService imageService) : IDomainEventConsumer<SolutionDeletedDomainEvent>
    {
        private readonly IImageService _imageService = imageService;

        public Task Handle(SolutionDeletedDomainEvent notification, CancellationToken cancellationToken)
        {
            _imageService.DeleteRange(ContainerName.SolutionImages, notification.Solution.Images.Select(x => x.BlobName));
            return Task.CompletedTask;
        }
    }
}
