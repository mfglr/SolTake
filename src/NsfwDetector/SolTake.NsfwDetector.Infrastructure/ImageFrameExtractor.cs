using Xabe.FFmpeg;

namespace SolTake.NsfwDetector.Infrastructure
{
    internal class ImageFrameExtractor
    {
        public async Task<string> ExtractAsync(string inputPath, string outputPath, double resulation, CancellationToken cancellationToken)
        {
            var info = await FFmpeg.GetMediaInfo(inputPath, cancellationToken);
            var vStream = info.VideoStreams.First();
            bool isScaleDownRequired = vStream.Height > vStream.Width ? vStream.Height > resulation : vStream.Height > resulation;
            var scale = $"scale='if(gt(iw,ih),{resulation},-2)':'if(gt(ih,iw),{resulation},-2)'";

            if (isScaleDownRequired)
            {
                await FFmpeg.Conversions.New()
                    .AddParameter($"-i \"{inputPath}\"")
                    .AddParameter($"-vf \"{scale}\"")
                    .SetOutput($"{outputPath}.jpg")
                    .Start(cancellationToken);

                return $"{outputPath}.jpg";
            }
            else
                return inputPath;
        }
    }
}
