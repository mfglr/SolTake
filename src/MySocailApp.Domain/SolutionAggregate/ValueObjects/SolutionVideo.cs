using MySocailApp.Domain.SolutionAggregate.Exceptions;

namespace MySocailApp.Domain.SolutionAggregate.ValueObjects
{
    public class SolutionVideo
    {
        public readonly static int MaxDuration = 60;
        public readonly static long MaxLength = 78643200;//75 mb

        public string BlobName { get; private set; }
        public double Duration { get; private set; }
        public long Length { get; private set; }
        public string FrameBlobName { get; private set; }
        public float FrameHeight { get; private set; }
        public float FrameWidth { get; private set; }

        public SolutionVideo(string blobName, double duration, long length, string frameBlobName, float frameHeight, float frameWidth)
        {
            if (duration > MaxDuration + 2)
                throw new SolutionVideoDurationException();

            if(length > MaxLength)
                throw new SolutionVideoLengthException();

            BlobName = blobName;
            Duration = duration;
            FrameBlobName = frameBlobName;
            FrameHeight = frameHeight;
            FrameWidth = frameWidth;
            Length = length;
        }

    }
}
