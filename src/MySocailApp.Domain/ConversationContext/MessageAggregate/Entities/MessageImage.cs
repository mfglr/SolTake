namespace MySocailApp.Domain.ConversationContext.MessageAggregate.Entities
{
    public class MessageImage
    {
        public int Id { get; private set; }
        public int MessageId { get; private set; }
        public string BlobName { get; private set; }
        public float Height { get; private set; }
        public float Width { get; private set; }

        public MessageImage(string blobName, float height, float width)
        {
            BlobName = blobName;
            Height = height;
            Width = width;
        }

        public Message Message { get; }
    }
}
