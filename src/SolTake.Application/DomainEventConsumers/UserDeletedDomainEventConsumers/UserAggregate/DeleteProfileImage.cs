using MySocailApp.Application.InfrastructureServices.BlobService;
using MySocailApp.Application.InfrastructureServices.BlobService.Objects;
using SolTake.Domain.UserAggregate.DomainEvents;
using SolTake.Core;

namespace MySocailApp.Application.DomainEventConsumers.UserDeletedDomainEventConsumers.UserAggregate
{
    public class DeleteProfileImage(IBlobService blobService) : IDomainEventConsumer<UserDeletedDomainEvent>
    {
        private readonly IBlobService _blobService = blobService;

        public async Task Handle(UserDeletedDomainEvent notification, CancellationToken cancellationToken)
        {
            if (notification.User.Image != null)
                await _blobService.DeleteAsync(ContainerName.ProfileImages, notification.User.Image!.BlobName, cancellationToken);
        }
    }
}
