using MassTransit;
using SolTake.Core.Events;

namespace SolTake.NsfwDetector.Application.ApplicationServices.CalculateMediaNsfwScore
{
    internal class CalculateMediaNsfwScoreHandler(TempDirectoryManager tempDirectoryManager, PathFinder pathFinder, UniqNameGenerator uniqNameGenerator, IBlobService blobService, INsfwDetector nsfwDetector, IPublishEndpoint publishEndpoint) : IConsumer<CalculateMediaNsfwScoreDto>
    {
        private readonly TempDirectoryManager _tempDirectoryManager = tempDirectoryManager;
        private readonly PathFinder _pathFinder = pathFinder;
        private readonly UniqNameGenerator _uniqNameGenerator = uniqNameGenerator;
        private readonly INsfwDetector _nsfwDetector = nsfwDetector;
        private readonly IBlobService _blobService = blobService;
        private readonly IPublishEndpoint _publishEndpoint = publishEndpoint;

        public async Task Consume(ConsumeContext<CalculateMediaNsfwScoreDto> context)
        {
            try
            {
                await _tempDirectoryManager.Create(context.CancellationToken);

                var inputStream = await _blobService.ReadAsync(context.Message.ContainerName, context.Message.BlobName, context.CancellationToken);
                var inputPath = await _tempDirectoryManager.AddAsync(inputStream, context.CancellationToken);
                inputStream.Close();
                inputStream.Dispose();

                var outputPath = _pathFinder.GetPath(_tempDirectoryManager.ScopeContainerName, _uniqNameGenerator.Generate());

                var scores = await _nsfwDetector.ClasifyAsync(inputPath, outputPath, context.Message.Type, context.CancellationToken);

                await _tempDirectoryManager.Delete(context.CancellationToken);

                await _publishEndpoint.Publish(
                    new MediaNsfwScoreCalculatedEvent(
                        context.Message.OwnerId,
                        context.Message.ContainerName,
                        context.Message.BlobName,
                        scores
                    ),
                    context.CancellationToken
                );
            }
            catch (Exception)
            {
                await _tempDirectoryManager.Delete(context.CancellationToken);
                throw;
            }
        }
    }
}
