using NAudio.Wave;

namespace SolTake.Infrastructure.InfrastructureServices.BlobService.InternalServices
{
    public class AudioDurationCalculator
    {
        public double Calculate(string path)
        {
            using var audioFile = new AudioFileReader(path);
            return audioFile.TotalTime.TotalSeconds;
        }

    }
}
