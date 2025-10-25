using SolTake.Core;
using SolTake.ThumbnailGenerator.Application;
using Xabe.FFmpeg;

namespace SolTake.ThumbnailGenerator.Infrastructure
{
    internal class DimentionCalculator : IDimentionCalculator
    {
        public async Task<Dimention> CalculateAsync(Stream stream, CancellationToken cancellationToken)
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
                var dimention = new Dimention(vStream.Height, vStream.Width);

                _tempDirectoryManager.Delete();
                return dimention;
            }
            catch (Exception)
            {
                _tempDirectoryManager.Delete();
                throw;
            }
        }
    }
}
