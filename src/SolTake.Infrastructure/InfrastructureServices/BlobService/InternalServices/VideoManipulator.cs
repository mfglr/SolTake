using SolTake.Application.InfrastructureServices.BlobService;
using SolTake.Application.InfrastructureServices.BlobService.Objects;
using Xabe.FFmpeg;

namespace SolTake.Infrastructure.InfrastructureServices.BlobService.InternalServices
{
    public class VideoManipulator(UniqNameGenerator blobNameGenerator, ITempDirectoryService tempDirectoryService, IPathFinder pathFinder)
    {
        private readonly UniqNameGenerator _blobNameGenerator = blobNameGenerator;
        private readonly ITempDirectoryService _tempDirectoryService = tempDirectoryService;
        private readonly IPathFinder _pathFinder = pathFinder;

        public async Task<string> Manipulate(string path, CancellationToken cancellationToken)
        {
            var outputBlobName = _blobNameGenerator.Generate("mp4");
            var outputPath = _pathFinder.GetPath(ContainerName.Temp, outputBlobName);

            FFmpeg.SetExecutablesPath("FFmpeg");
            var conversation = FFmpeg.Conversions
                .New()
                .AddParameter($"-i \"{path}\" -vf scale=480:-2 -c:v libx265 -crf 28 -movflags +faststart -c:a libopus -r 30 -preset medium \"{outputPath}\"");
            await conversation.Start(cancellationToken);

            return outputBlobName;
        }
    }
}
