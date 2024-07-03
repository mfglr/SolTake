namespace MySocailApp.Domain.AppUserAggregate
{
    public class UserImage
    {
        public string BlobName { get; private set; }
        public DateTime CreatedAt { get; private set; }

        public UserImage(string blobName, DateTime createdAt)
        {
            BlobName = blobName;
            CreatedAt = createdAt;
        }

        public AppUserImage ToAppUserImage()
        {
            return AppUserImage.GenerateRemovedAppUserImage(BlobName, CreatedAt);
        }
    }
}
