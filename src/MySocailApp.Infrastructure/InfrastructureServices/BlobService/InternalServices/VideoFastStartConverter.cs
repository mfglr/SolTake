using Xabe.FFmpeg;

namespace MySocailApp.Infrastructure.InfrastructureServices.BlobService.InternalServices
{
    public class VideoFastStartConverter(UniqNameGenerator blobNameGenerator,TempDirectoryService tempDirectoryService)
    {
        private readonly UniqNameGenerator _blobNameGenerator = blobNameGenerator;
        private readonly TempDirectoryService _tempDirectoryService = tempDirectoryService;

        public async Task<string> Convert(string path, CancellationToken cancellationToken)
        {
            var outputBlobName = _blobNameGenerator.Generate("mp4");
            var outputPath = _tempDirectoryService.GetBlobPath(outputBlobName);
            
            FFmpeg.SetExecutablesPath("FFmpeg");
            var conversation = FFmpeg.Conversions
                .New()
                .AddParameter($"-i \"{path}\" -c:v libx264 -c:a aac -movflags +faststart \"{outputPath}\"");
            await conversation.Start(cancellationToken);

            return outputPath;
        }
    }
}
