using SolTake.MediaMetadataService.Application;
using Xabe.FFmpeg;

namespace SolTake.MediaMetadataService.Infrastructure
{
    internal class DimentionCalculator : IDimentionCalculator
    {
        public async Task<(double width, double height)> CalculateAsync(Stream stream, CancellationToken cancellationToken)
        {
            InternalTempDirectoryManager _tempDirectoryManager = new();
            try
            {
                _tempDirectoryManager.Create();
                
                var inputPath = await _tempDirectoryManager.AddAsync(stream, cancellationToken);
                var outputPath = _tempDirectoryManager.GeneratePath("jpg");

                await FFmpeg.Conversions.New()
                    .AddParameter($"-i \"{inputPath}\"")
                    .AddParameter($"-frames:v 1")
                    .SetOutput(outputPath)
                    .Start(cancellationToken);

                var info = await FFmpeg.GetMediaInfo(outputPath, cancellationToken);
                var vStream = info.VideoStreams.First();

                _tempDirectoryManager.Delete();
                return (vStream.Width, vStream.Height);
            }
            catch (Exception)
            {
                _tempDirectoryManager.Delete();
                throw;
            }
        }
    }
}
