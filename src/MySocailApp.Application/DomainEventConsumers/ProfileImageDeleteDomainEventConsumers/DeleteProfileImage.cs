using MySocailApp.Application.ApplicationServices.BlobService;
using MySocailApp.Core;
using MySocailApp.Domain.AppUserAggregate.DomainEvents;

namespace MySocailApp.Application.DomainEventConsumers.ProfileImageDeleteDomainEventConsumers
{
    public class DeleteProfileImage(IBlobService blobService) : IDomainEventConsumer<ProfileImageDeletedDomainEvent>
    {
        private readonly IBlobService _blobService = blobService;

        public async Task Handle(ProfileImageDeletedDomainEvent notification, CancellationToken cancellationToken)
            => _blobService.Delete(ContainerName.UserImages, notification.Image.BlobName);
    }
}
