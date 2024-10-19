using MySocailApp.Application.ApplicationServices.BlobService.ImageServices;
using MySocailApp.Application.ApplicationServices.BlobService.Objects;
using MySocailApp.Core;
using MySocailApp.Domain.AppUserAggregate.DomainEvents;

namespace MySocailApp.Application.DomainEventConsumers.UserDeletedDomainEventConsumers.UserAggregate
{
    public class DeleteProfileImage(IImageService imageService) : IDomainEventConsumer<UserDeletedDomainEvent>
    {
        private readonly IImageService _imageService = imageService;

        public Task Handle(UserDeletedDomainEvent notification, CancellationToken cancellationToken)
        {
            if (notification.User.HasImage)
                _imageService.Delete(ContainerName.UserImages, notification.User.Image!.BlobName);
            return Task.CompletedTask;
        }
    }
}
