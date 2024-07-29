using MySocailApp.Domain.AppUserAggregate.Entities;

namespace MySocailApp.Domain.AppUserAggregate.ValueObjects
{
    public class UserImage(string blobName, DateTime createdAt)
    {
        public string BlobName { get; private set; } = blobName;
        public DateTime CreatedAt { get; private set; } = createdAt;

        public AppUserImage ToAppUserImage()
        {
            return AppUserImage.GenerateRemovedAppUserImage(BlobName, CreatedAt);
        }
    }
}
