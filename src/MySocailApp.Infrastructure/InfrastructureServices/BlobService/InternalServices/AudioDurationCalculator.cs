using NAudio.Wave;

namespace MySocailApp.Infrastructure.InfrastructureServices.BlobService.InternalServices
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
