namespace MySocailApp.Domain.AppUserAggregate.ValueObjects
{
    public class ProfileImage(string blobName, DateTime createdAt)
    {
        public string BlobName { get; private set; } = blobName;
        public DateTime CreatedAt { get; private set; } = createdAt;
    }
}
