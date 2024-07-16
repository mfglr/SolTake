namespace MySocailApp.Domain.QuestionAggregate
{
    public class QuestionImage
    {
        public int Id { get; private set; }
        public DateTime CreatedAt { get; private set; }
        public string BlobName { get; private set; }
        public Dimention Dimention { get; private set; }
        
        private QuestionImage() { }

        private QuestionImage(string blobName, Dimention dimention)
        {
            BlobName = blobName;
            Dimention = dimention;
        }

        public static QuestionImage Create(string blobName,Dimention dimention)
            => new(blobName,dimention) { CreatedAt = DateTime.UtcNow };
    }
}
