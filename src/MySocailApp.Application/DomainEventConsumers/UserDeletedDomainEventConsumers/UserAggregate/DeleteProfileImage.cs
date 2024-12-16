using MySocailApp.Application.InfrastructureServices.BlobService;
using MySocailApp.Application.InfrastructureServices.BlobService.Objects;
using MySocailApp.Core;
using MySocailApp.Domain.UserAggregate.DomainEvents;

namespace MySocailApp.Application.DomainEventConsumers.UserDeletedDomainEventConsumers.UserAggregate
{
    public class DeleteProfileImage(IBlobService blobService) : IDomainEventConsumer<UserDeletedDomainEvent>
    {
        private readonly IBlobService _blobService = blobService;

        public async Task Handle(UserDeletedDomainEvent notification, CancellationToken cancellationToken)
        {
            if (notification.User.HasImage)
                await _blobService.DeleteAsync(ContainerName.ProfileImages, notification.User.Image!.BlobName, cancellationToken);
        }
    }
}
