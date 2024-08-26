using MySocailApp.Core;

namespace MySocailApp.Domain.MessageAggregate.Entities
{
    public class MessageImage(string blobName, float height, float width) : Entity
    {
        public int MessageId { get; private set; }
        public string BlobName { get; private set; } = blobName;
        public float Height { get; private set; } = height;
        public float Width { get; private set; } = width;

        public Message Message { get; } = null!;
    }
}
