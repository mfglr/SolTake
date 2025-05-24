using SolTake.Application.InfrastructureServices.BlobService;
using SolTake.Application.InfrastructureServices.BlobService.Objects;
using Xabe.FFmpeg;

namespace SolTake.Infrastructure.InfrastructureServices.BlobService.InternalServices
{
    public class AudioManipulator(UniqNameGenerator blobNameGenerator, ITempDirectoryService tempDirectoryService, IPathFinder pathFinder)
    {
        private readonly UniqNameGenerator _blobNameGenerator = blobNameGenerator;
        private readonly ITempDirectoryService _tempDirectoryService = tempDirectoryService;
        private readonly IPathFinder _pathFinder = pathFinder;

        public async Task<string> Manipulate(string path, CancellationToken cancellationToken)
        {
            var outputBlobName = _blobNameGenerator.Generate("opus");
            var outputPath = _pathFinder.GetPath(ContainerName.Temp, outputBlobName);

            FFmpeg.SetExecutablesPath("FFmpeg");
            var conversation = FFmpeg.Conversions
                .New()
                .AddParameter($"-i \"{path}\" -c:a libopus \"{outputPath}\"");
            await conversation.Start(cancellationToken);

            return outputBlobName;
        }
    }
}
