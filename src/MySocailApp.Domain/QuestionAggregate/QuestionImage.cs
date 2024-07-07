namespace MySocailApp.Domain.QuestionAggregate
{
    public class QuestionImage
    {
        public int Id { get; private set; }
        public string BlobName { get; private set; }
        public DateTime CreatedAt { get; private set; }

        private QuestionImage(string blobName) => BlobName = blobName;

        public static QuestionImage Create(string blobName)
            => new(blobName) { CreatedAt = DateTime.UtcNow };
    }
}
