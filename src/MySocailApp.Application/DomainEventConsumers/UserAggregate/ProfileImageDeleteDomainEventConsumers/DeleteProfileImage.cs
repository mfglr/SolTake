using MySocailApp.Application.ApplicationServices.BlobService;
using MySocailApp.Application.ApplicationServices.BlobService.Objects;
using MySocailApp.Core;
using MySocailApp.Domain.AppUserAggregate.DomainEvents;

namespace MySocailApp.Application.DomainEventConsumers.UserAggregate.ProfileImageDeleteDomainEventConsumers
{
    public class DeleteProfileImage(IBlobService blobService) : IDomainEventConsumer<ProfileImageDeletedDomainEvent>
    {
        private readonly IBlobService _blobService = blobService;

        public Task Handle(ProfileImageDeletedDomainEvent notification, CancellationToken cancellationToken)
        {
            _blobService.Delete(ContainerName.UserImages, notification.Image.BlobName);
            return Task.CompletedTask;
        }
    }
}
