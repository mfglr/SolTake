namespace MySocailApp.Domain.QuestionAggregate.ValueObjects
{
    public class QuestionVideo(string blobName, double duration, long length)
    {
        public string BlobName { get; private set; } = blobName;
        public double Duration { get; private set; } = duration;
        public long Length { get; private set; } = length;
    }
}
