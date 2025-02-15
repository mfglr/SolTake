using MySocailApp.Application.InfrastructureServices.BlobService;
using MySocailApp.Application.InfrastructureServices.BlobService.Objects;
using MySocailApp.Core;
using MySocailApp.Domain.UserDomain.UserAggregate.DomainEvents;

namespace MySocailApp.Application.DomainEventConsumers.ProfileImageDeleteDomainEventConsumers.UserAggregate
{
    public class DeleteProfileImage(IBlobService blobService) : IDomainEventConsumer<ProfileImageDeletedDomainEvent>
    {
        private readonly IBlobService _blobService = blobService;

        public Task Handle(ProfileImageDeletedDomainEvent notification, CancellationToken cancellationToken)
            => _blobService.DeleteAsync(ContainerName.ProfileImages, notification.Image!.BlobName, cancellationToken);
    }
}
