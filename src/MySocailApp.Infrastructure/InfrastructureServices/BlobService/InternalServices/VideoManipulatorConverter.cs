using Xabe.FFmpeg;

namespace MySocailApp.Infrastructure.InfrastructureServices.BlobService.InternalServices
{
    public class VideoManipulatorConverter(UniqNameGenerator blobNameGenerator,TempDirectoryService tempDirectoryService)
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
                .AddParameter($"-i \"{path}\" -vf scale=-1:854 -c:v libx265 -crf 28 -movflags +faststart -c:a aac -b:a 128k -r 30 -preset medium \"{outputPath}\"");
            await conversation.Start(cancellationToken);

            return outputPath;
        }
    }
}
