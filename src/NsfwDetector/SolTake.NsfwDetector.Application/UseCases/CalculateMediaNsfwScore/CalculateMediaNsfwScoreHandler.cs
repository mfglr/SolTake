using MassTransit;
using SolTake.Core.Events.MediaEvents;

namespace SolTake.NsfwDetector.Application.UseCases.CalculateMediaNsfwScore
{
    internal class CalculateMediaNsfwScoreHandler(TempDirectoryManager tempDirectoryManager, PathFinder pathFinder, UniqNameGenerator uniqNameGenerator, IBlobService blobService, IPublishEndpoint publishEndpoint, INsfwDetector nsfwDetector) : IConsumer<CalculateMediaNsfwScore>
    {
        private readonly TempDirectoryManager _tempDirectoryManager = tempDirectoryManager;
        private readonly PathFinder _pathFinder = pathFinder;
        private readonly UniqNameGenerator _uniqNameGenerator = uniqNameGenerator;
        private readonly IBlobService _blobService = blobService;
        private readonly IPublishEndpoint _publishEndpoint = publishEndpoint;
        private readonly INsfwDetector _nsfwDetector = nsfwDetector;

        public async Task Consume(ConsumeContext<CalculateMediaNsfwScore> context)
        {
            try
            {
                _tempDirectoryManager.Create();

                var inputStream = await _blobService.ReadAsync(context.Message.ContainerName, context.Message.BlobName, context.CancellationToken);
                var inputPath = await _tempDirectoryManager.AddAsync(inputStream, context.CancellationToken);
                inputStream.Close();
                inputStream.Dispose();

                var outputPath = _pathFinder.GetPath(_tempDirectoryManager.ScopeContainerName, _uniqNameGenerator.Generate());
                var scores = await _nsfwDetector.ClasifyAsync(inputPath, outputPath, context.Message.Type, context.CancellationToken);

                _tempDirectoryManager.Delete();

                await _publishEndpoint.Publish(new MediaNsfwScoresCalculated(context.Message.Id, scores),context.CancellationToken);
            }
            catch (Exception)
            {
                _tempDirectoryManager.Delete();
                throw;
            }
        }
    }
}
