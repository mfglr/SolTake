using MySocailApp.Application.ApplicationServices.BlobService.ImageServices;
using MySocailApp.Application.ApplicationServices.BlobService.Objects;
using MySocailApp.Core;
using MySocailApp.Domain.MessageAggregate.DomainEvents;

namespace MySocailApp.Application.DomainEventConsumers.MessageAggregate.MessageDeletedDomainEventConsumers
{
    public class DeleteImages(IImageService blobService) : IDomainEventConsumer<MessageDeletedDomainEvent>
    {
        private readonly IImageService _blobService = blobService;

        public Task Handle(MessageDeletedDomainEvent notification, CancellationToken cancellationToken)
        {
            _blobService.DeleteRange(ContainerName.MesssageImages, notification.message.Images.Select(x => x.BlobName));
            return Task.CompletedTask;
        }
    }
}
