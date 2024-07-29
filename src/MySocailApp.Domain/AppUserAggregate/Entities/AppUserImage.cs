namespace MySocailApp.Domain.AppUserAggregate.Entities
{
    public class AppUserImage
    {
        public int Id { get; private set; }
        public DateTime RemovedAt { get; private set; }
        public DateTime CreatedAt { get; private set; }
        public string BlobName { get; private set; }

        private AppUserImage(string blobName, DateTime createdAt)
        {
            BlobName = blobName;
            CreatedAt = createdAt;
        }

        internal static AppUserImage GenerateRemovedAppUserImage(string blobName, DateTime createdAt)
        {
            return new(blobName, createdAt) { RemovedAt = DateTime.UtcNow };
        }
    }
}
