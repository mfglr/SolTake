using MySocailApp.Application.InfrastructureServices.BlobService.ImageServices;
using MySocailApp.Application.InfrastructureServices.BlobService.Objects;
using MySocailApp.Core;
using MySocailApp.Domain.AppUserAggregate.DomainEvents;

namespace MySocailApp.Application.DomainEventConsumers.ProfileImageDeleteDomainEventConsumers.UserAggregate
{
    public class DeleteProfileImage(IImageService imageService) : IDomainEventConsumer<ProfileImageDeletedDomainEvent>
    {
        private readonly IImageService _imageService = imageService;

        public Task Handle(ProfileImageDeletedDomainEvent notification, CancellationToken cancellationToken)
        {
            _imageService.Delete(ContainerName.UserImages, notification.Image.BlobName);
            return Task.CompletedTask;
        }
    }
}
