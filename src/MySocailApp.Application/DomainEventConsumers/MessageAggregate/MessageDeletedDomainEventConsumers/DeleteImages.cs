using MySocailApp.Application.ApplicationServices.BlobService;
using MySocailApp.Core;
using MySocailApp.Domain.MessageAggregate.DomainEvents;

namespace MySocailApp.Application.DomainEventConsumers.MessageAggregate.MessageDeletedDomainEventConsumers
{
    public class DeleteImages(IBlobService blobService) : IDomainEventConsumer<MessageDeletedDomainEvent>
    {
        private readonly IBlobService _blobService = blobService;

        public Task Handle(MessageDeletedDomainEvent notification, CancellationToken cancellationToken)
        {
            _blobService.DeleteRange(ContainerName.MesssageImages, notification.message.Images.Select(x => x.BlobName));
            return Task.CompletedTask;
        }
    }
}
