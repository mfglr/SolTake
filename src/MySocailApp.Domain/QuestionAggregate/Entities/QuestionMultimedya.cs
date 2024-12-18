using MySocailApp.Domain.QuestionAggregate.ValueObjects;

namespace MySocailApp.Domain.QuestionAggregate.Entities
{
    public class QuestionMultimedya
    {
        public int Id { get; private set; }
        public int QuestionId { get; private set; }
        public string BlobName { get; private set; }
        public long Size { get; private set; }
        public double Height { get; private set; }
        public double Width { get; private set; }
        public double Duration { get; private set; }
        public QuestionMedyaType MedyaType { get; private set; }

        private QuestionMultimedya(string blobName, long size, double height, double width)
        {
            BlobName = blobName;
            Size = size;
            Height = height;
            Width = width;
        }

        private QuestionMultimedya(string blobName, long size, double height, double width, double duration)
        {
            BlobName = blobName;
            Size = size;
            Height = height;
            Width = width;
            Duration = duration;
        }

        public static QuestionMultimedya CreateImage(string blobName, long size, double height, double width)
            => new (blobName, size, height, width) { MedyaType = QuestionMedyaType.Image, Duration = 0 };
        public static QuestionMultimedya CreateVideo(string blobName, long size, double height, double width, double duration)
            => new (blobName, size, height, width, duration) { MedyaType = QuestionMedyaType.Video };
    }
}
