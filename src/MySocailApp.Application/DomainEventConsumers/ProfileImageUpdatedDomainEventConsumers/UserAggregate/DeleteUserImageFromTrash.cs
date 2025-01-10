using MySocailApp.Application.InfrastructureServices.BlobService;
using MySocailApp.Application.InfrastructureServices.BlobService.Objects;
using MySocailApp.Core;
using MySocailApp.Domain.UserAggregate.DomainEvents;

namespace MySocailApp.Application.DomainEventConsumers.ProfileImageUpdatedDomainEventConsumers.UserAggregate
{
    public class DeleteUserImageFromTrash(IBlobService blobService) : IDomainEventConsumer<ProfileImageUpdatedDomainEvent>
    {
        private readonly IBlobService _blobService = blobService;

        public Task Handle(ProfileImageUpdatedDomainEvent notification, CancellationToken cancellationToken)
            => _blobService.DeleteAsync(ContainerName.ProfileImages,notification.UserId.ToString(),cancellationToken);
    }
}
