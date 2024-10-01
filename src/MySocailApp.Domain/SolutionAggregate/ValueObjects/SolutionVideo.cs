using MySocailApp.Domain.SolutionAggregate.Exceptions;

namespace MySocailApp.Domain.SolutionAggregate.ValueObjects
{
    public class SolutionVideo
    {
        public readonly static int MaxDuration = 60; 

        public string BlobName { get; private set; }
        public double Duration { get; private set; }
        public string FrameBlobName { get; private set; }
        public float FrameHeight { get; private set; }
        public float FrameWidth { get; private set; }

        public SolutionVideo(string blobName, double duration,string frameBlobName, float frameHeight, float frameWidth)
        {
            if (duration > MaxDuration)
                throw new SolutionVideoDurationException();

            BlobName = blobName;
            Duration = duration;
            FrameBlobName = frameBlobName;
            FrameHeight = frameHeight;
            FrameWidth = frameWidth;
        }

    }
}
