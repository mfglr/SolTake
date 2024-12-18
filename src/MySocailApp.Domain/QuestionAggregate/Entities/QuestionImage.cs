namespace MySocailApp.Domain.QuestionAggregate.Entities
{
    public class QuestionImage
    {
        public int Id { get; private set; }
        public DateTime CreatedAt { get; private set; }
        public int QuestionId { get; private set; }
        public string BlobName { get; private set; }
        public double Height { get; private set; }
        public double Width { get; private set; }

        private QuestionImage(string blobName, double height, double width)
        {
            BlobName = blobName;
            Height = height;
            Width = width;
        }

        public static QuestionImage Create(string blobName, double height, double width)
            => new(blobName, height, width) { CreatedAt = DateTime.UtcNow };
    }
}
