using MySocailApp.Domain.SolutionAggregate.Exceptions;

namespace MySocailApp.Domain.SolutionAggregate.ValueObjects
{
    public class SolutionVideo
    {
        public readonly static int MaxDuration = 60; 

        public string BlobName { get; private set; }
        public double Duration { get; private set; }

        public SolutionVideo(string blobName, double duration)
        {
            if (duration > MaxDuration)
                throw new SolutionVideoDurationException();
            BlobName = blobName;
            Duration = duration;
        }

    }
}
