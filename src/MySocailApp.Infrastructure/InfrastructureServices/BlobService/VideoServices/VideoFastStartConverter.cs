using MySocailApp.Application.InfrastructureServices.BlobService;
using MySocailApp.Application.InfrastructureServices.BlobService.Objects;
using MySocailApp.Application.InfrastructureServices.BlobService.VideoServices;
using Xabe.FFmpeg;

namespace MySocailApp.Infrastructure.InfrastructureServices.BlobService.VideoServices
{
    public class VideoFastStartConverter(IPathFinder pathFinder, IBlobNameGenerator blobNameGenerator) : IVideoFastStartConverter
    {
        private readonly IPathFinder _pathFinder = pathFinder;
        private readonly IBlobNameGenerator _blobNameGenerator = blobNameGenerator;

        public async Task<string> Convert(string containerName, string blobName, CancellationToken cancellationToken)
        {
            var input = _pathFinder.GetPath(RootName.Video, containerName, blobName);
            var outputBlobName = _blobNameGenerator.Generate(RootName.Video, containerName, "mp4");
            var output = _pathFinder.GetPath(RootName.Video, containerName, outputBlobName);

            FFmpeg.SetExecutablesPath("FFmpeg");
            var conversation = FFmpeg.Conversions.New().AddParameter($"-i \"{input}\" -c:v libx264 -c:a aac -movflags +faststart \"{output}\"");
            await conversation.Start(cancellationToken);

            return outputBlobName;
        }
    }
}
