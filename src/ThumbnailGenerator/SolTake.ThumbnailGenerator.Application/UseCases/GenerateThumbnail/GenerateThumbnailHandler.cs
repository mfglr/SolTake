using MassTransit;
using SolTake.Core.Events.MediaEvents;
using SolTake.ThumbnailGenerator.Application.TempManager;

namespace SolTake.ThumbnailGenerator.Application.UseCases.GenerateThumbnail
{
    internal class GenerateThumbnailHandler(IBlobService blobService, IThumbnailGenerator thumbnailGenerator, TempDirectoryManager tempDirectoryManager, UniqNameGenerator uniqNamgeGenerator, PathFinder pathFinder, IPublishEndpoint publishEndpoint) : IConsumer<GenerateThumbnail>
    {
        private readonly IBlobService _blobService = blobService;
        private readonly IThumbnailGenerator _thumbnailGenerator = thumbnailGenerator;
        private readonly IPublishEndpoint _publishEndpoint = publishEndpoint;
        private readonly TempDirectoryManager _tempDirectoryManager = tempDirectoryManager;
        private readonly UniqNameGenerator _uniqNamgeGenerator = uniqNamgeGenerator;
        private readonly PathFinder _pathFinder = pathFinder;

        public async Task Consume(ConsumeContext<GenerateThumbnail> context)
        {
            try
            {
                _tempDirectoryManager.Create();

                var stream = await _blobService.GetAsync(context.Message.ContainerName, context.Message.BlobName, context.CancellationToken);
                var tempPath = await _tempDirectoryManager.AddAsync(stream, context.CancellationToken);
                stream.Close();
                stream.Dispose();

                var outputBlobName = _uniqNamgeGenerator.Generate("jpg");
                var outputPath = _pathFinder.GetPath(_tempDirectoryManager.ScopeContainerName, outputBlobName);
                await _thumbnailGenerator.GenerateAsync(tempPath, outputPath, context.Message.Resulation, context.Message.IsSquare, context.CancellationToken);

                string blobName = _uniqNamgeGenerator.Generate();
                var outputStream = _tempDirectoryManager.Read(outputBlobName);
                await _blobService.UploadAsync(outputStream, context.Message.ContainerName, blobName, context.CancellationToken);
                outputStream.Close();
                outputStream.Dispose();

                _tempDirectoryManager.Delete();

                await _publishEndpoint.Publish(
                    new ThumbnailGenerated(
                        context.Message.Id,
                        blobName,
                        context.Message.Resulation,
                        context.Message.IsSquare
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
