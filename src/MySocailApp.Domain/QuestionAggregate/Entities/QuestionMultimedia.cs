using MySocailApp.Core;

namespace MySocailApp.Domain.QuestionAggregate.Entities
{
    public class QuestionMultimedia
    {
        public int Id { get; private set; }
        public int QuestionId { get; private set; }
        public string ContainerName { get; private set; }
        public string BlobName { get; private set; }
        public long Size { get; private set; }
        public double Height { get; private set; }
        public double Width { get; private set; }
        public double Duration { get; private set; }
        public MultimediaType MultimediaType { get; private set; }

        private QuestionMultimedia() { }

        public QuestionMultimedia(Multimedia media)
        {
            ContainerName = media.ContainerName;
            BlobName = media.BlobName;
            Size = media.Size;
            Height = media.Height;
            Width = media.Width;
            Duration = media.Duration;
            MultimediaType = media.MultimediaType;
        }
        
    }
}
