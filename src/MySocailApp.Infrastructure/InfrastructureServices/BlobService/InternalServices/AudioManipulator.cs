using Xabe.FFmpeg;

namespace MySocailApp.Infrastructure.InfrastructureServices.BlobService.InternalServices
{
    public class AudioManipulator(UniqNameGenerator blobNameGenerator, TempDirectoryService tempDirectoryService)
    {
        private readonly UniqNameGenerator _blobNameGenerator = blobNameGenerator;
        private readonly TempDirectoryService _tempDirectoryService = tempDirectoryService;

        public async Task<string> Manipulate(string path, CancellationToken cancellationToken)
        {
            var outputBlobName = _blobNameGenerator.Generate("opus");
            var outputPath = _tempDirectoryService.GetBlobPath(outputBlobName);

            FFmpeg.SetExecutablesPath("FFmpeg");
            var conversation = FFmpeg.Conversions
                .New()
                .AddParameter($"-i \"{path}\" -c:a libopus \"{outputPath}\"");
            await conversation.Start(cancellationToken);

            return outputPath;
        }
    }
}
