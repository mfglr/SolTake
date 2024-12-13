using MySocailApp.Domain.SolutionAggregate.Exceptions;

namespace MySocailApp.Domain.SolutionAggregate.ValueObjects
{
    public class SolutionVideo
    {
        public readonly static int MaxDuration = 120;
        public readonly static long MaxLength = 157286400;//150 mb
        public readonly static long MaxLenghtMB = 150;

        public string BlobName { get; private set; }
        public double Duration { get; private set; }
        public long Length { get; private set; }

        public SolutionVideo(string blobName, double duration, long length)
        {
            if (duration > MaxDuration + 2)
                throw new SolutionVideoDurationException();

            if(length > MaxLength)
                throw new SolutionVideoLengthException();

            BlobName = blobName;
            Duration = duration;
            Length = length;
        }

    }
}
