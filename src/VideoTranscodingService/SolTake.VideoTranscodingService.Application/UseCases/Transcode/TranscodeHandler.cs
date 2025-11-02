using MassTransit;
using SolTake.Core.Events.MediaEvents;
using SolTake.VideoTranscodingService.Application.TempManager;

namespace SolTake.VideoTranscodingService.Application.UseCases.Transcode
{
    internal class TranscodeHandler(PathFinder pathFinder, TempDirectoryManager tempDirectoryManager, IBlobService blobService, IVideoTranscoder videoTranscoder, UniqNameGenerator uniqNameGenerator, IPublishEndpoint publishEndpoint) : IConsumer<Transcode>
    {
        private readonly UniqNameGenerator _uniqNameGenerator = uniqNameGenerator;
        private readonly PathFinder _pathFinder = pathFinder;
        private readonly TempDirectoryManager _tempDirectoryManager = tempDirectoryManager;
        private readonly IBlobService _blobService = blobService;
        private readonly IVideoTranscoder _videoTranscoder = videoTranscoder;
        private readonly IPublishEndpoint _publishEndpoint = publishEndpoint;
        public async Task Consume(ConsumeContext<Transcode> context)
        {
            try
            {
                _tempDirectoryManager.Create();

                var stream = await _blobService.GetAsync(context.Message.ContainerName, context.Message.BlobName, context.CancellationToken);
                var inputPath = await _tempDirectoryManager.AddAsync(stream, context.CancellationToken);
                stream.Close();
                stream.Dispose();

                var blobName = _uniqNameGenerator.Generate("mp4");
                var outputPath = _pathFinder.GetPath(_tempDirectoryManager.ScopeContainerName, blobName);
                await _videoTranscoder.Transcode(inputPath, outputPath, context.CancellationToken);

                var transcodedStrem = _tempDirectoryManager.Read(blobName);
                var transcodedBlobName = _uniqNameGenerator.Generate();
                await _blobService.UploadAsync(transcodedStrem, context.Message.ContainerName, transcodedBlobName, context.CancellationToken);
                transcodedStrem.Close();
                transcodedStrem.Dispose();

                _tempDirectoryManager.Delete();

                await _publishEndpoint.Publish(
                    new VideoTranscoded(
                        context.Message.Id,
                        transcodedBlobName
                    ),
                    context.CancellationToken
                );
            }
            catch (Exception)
            {
                _tempDirectoryManager.Delete();
                throw;
            }
        }
    }
}
