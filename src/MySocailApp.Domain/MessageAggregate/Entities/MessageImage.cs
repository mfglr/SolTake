using MySocailApp.Core;

namespace MySocailApp.Domain.MessageAggregate.Entities
{
    public class MessageImage(string blobName, double height, double width) : Entity
    {
        public int MessageId { get; private set; }
        public string BlobName { get; private set; } = blobName;
        public double Height { get; private set; } = height;
        public double Width { get; private set; } = width;
    }
}
