using MySocailApp.Core;
using MySocailApp.Domain.QuestionDomain.QuestionAggregate.Excpetions;

namespace MySocailApp.Domain.QuestionDomain.QuestionAggregate.Entities
{
    public class QuestionMultimedia
    {
        public int Id { get; private set; }
        public int QuestionId { get; private set; }
        public string ContainerName { get; private set; }
        public string BlobName { get; private set; }
        public string? BlobNameOfFrame { get; private set; }
        public long Size { get; private set; }
        public double Height { get; private set; }
        public double Width { get; private set; }
        public double Duration { get; private set; }
        public MultimediaType MultimediaType { get; private set; }

        private QuestionMultimedia() { }

        public QuestionMultimedia(Multimedia media)
        {
            if (media.MultimediaType == MultimediaType.Video && media.Duration > 300)
                throw new QuestionVideoDurationException();

            ContainerName = media.ContainerName;
            BlobName = media.BlobName;
            BlobNameOfFrame = media.BlobNameOfFrame;
            Size = media.Size;
            Height = media.Height;
            Width = media.Width;
            Duration = media.Duration;
            MultimediaType = media.MultimediaType;
        }

    }
}
