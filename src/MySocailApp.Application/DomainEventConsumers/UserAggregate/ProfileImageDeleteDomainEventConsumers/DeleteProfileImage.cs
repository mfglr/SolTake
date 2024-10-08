using MySocailApp.Application.ApplicationServices.BlobService.ImageServices;
using MySocailApp.Application.ApplicationServices.BlobService.Objects;
using MySocailApp.Core;
using MySocailApp.Domain.AppUserAggregate.DomainEvents;

namespace MySocailApp.Application.DomainEventConsumers.UserAggregate.ProfileImageDeleteDomainEventConsumers
{
    public class DeleteProfileImage(IImageService blobService) : IDomainEventConsumer<ProfileImageDeletedDomainEvent>
    {
        private readonly IImageService _blobService = blobService;

        public Task Handle(ProfileImageDeletedDomainEvent notification, CancellationToken cancellationToken)
        {
            _blobService.Delete(ContainerName.UserImages, notification.Image.BlobName);
            return Task.CompletedTask;
        }
    }
}
