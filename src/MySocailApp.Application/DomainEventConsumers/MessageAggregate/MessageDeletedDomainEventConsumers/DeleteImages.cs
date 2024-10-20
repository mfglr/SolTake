using MySocailApp.Application.InfrastructureServices.BlobService.ImageServices;
using MySocailApp.Application.InfrastructureServices.BlobService.Objects;
using MySocailApp.Core;
using MySocailApp.Domain.MessageAggregate.DomainEvents;

namespace MySocailApp.Application.DomainEventConsumers.MessageAggregate.MessageDeletedDomainEventConsumers
{
    public class DeleteImages(IImageService imageService) : IDomainEventConsumer<MessageDeletedDomainEvent>
    {
        private readonly IImageService _imageService = imageService;
        public Task Handle(MessageDeletedDomainEvent notification, CancellationToken cancellationToken)
        {
            _imageService.DeleteRange(ContainerName.MesssageImages, notification.message.Images.Select(x => x.BlobName));
            return Task.CompletedTask;
        }
    }
}
