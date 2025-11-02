using MassTransit;

namespace SolTake.NsfwDetector.Application.UseCases.CalculateFrameNsfwScores
{
    internal class CalculateFrameNsfwScoresHandler(TempDirectoryManager tempDirectoryManager, IFrameExtractor frameExtractor, IBlobService blobService, UniqNameGenerator uniqNameGenerator, PathFinder pathFinder, INsfwDetector nsfwDetector) : IConsumer<CalculateFrameNsfwScores>
    {
        private readonly PathFinder _pathFinder = pathFinder;
        private readonly UniqNameGenerator _uniqNameGenerator = uniqNameGenerator;
        private readonly TempDirectoryManager _tempDirectoryManager = tempDirectoryManager;
        private readonly IFrameExtractor _frameExtractor = frameExtractor;
        private readonly IBlobService _blobService = blobService;
        private readonly INsfwDetector _nsfwDetector = nsfwDetector;

        public async Task Consume(ConsumeContext<CalculateFrameNsfwScores> context)
        {
            try
            {
                _tempDirectoryManager.Create();

                var inputStream = await _blobService.ReadAsync(context.Message.ContainerName, context.Message.BlobName, context.CancellationToken);
                var inputPath = await _tempDirectoryManager.AddAsync(inputStream, context.CancellationToken);
                inputStream.Close();
                inputStream.Dispose();

                var framePath = _pathFinder.GetPath(_tempDirectoryManager.ScopeContainerName, _uniqNameGenerator.Generate());
                await _frameExtractor.ExstractAsync(inputPath, framePath, context.CancellationToken, positionMs: context.Message.PositionMs);

                var scores = await _nsfwDetector.ClasifyImageAsync(inputPath, context.CancellationToken);

                _tempDirectoryManager.Delete();

                await context.RespondAsync(new CalculateFrameNsfwScoresResponse(scores));
            }
            catch (Exception)
            {
                _tempDirectoryManager.Delete();
            }
        }
    }
}
