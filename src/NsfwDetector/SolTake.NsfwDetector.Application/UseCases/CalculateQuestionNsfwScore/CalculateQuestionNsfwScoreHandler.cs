using MassTransit;
using SolTake.Core.Events.QuestionEvents;
using SolTake.Core.Media;

namespace SolTake.NsfwDetector.Application.UseCases.CalculateQuestionNsfwScore
{
    internal class CalculateQuestionNsfwScoreHandler(TempDirectoryManager tempDirectoryManager, PathFinder pathFinder, UniqNameGenerator uniqNameGenerator, IBlobService blobService, IPublishEndpoint publishEndpoint, INsfwDetector nsfwDetector) : IConsumer<CalculateQuestionNsfwScore>
    {
        private readonly TempDirectoryManager _tempDirectoryManager = tempDirectoryManager;
        private readonly PathFinder _pathFinder = pathFinder;
        private readonly UniqNameGenerator _uniqNameGenerator = uniqNameGenerator;
        private readonly IBlobService _blobService = blobService;
        private readonly IPublishEndpoint _publishEndpoint = publishEndpoint;
        private readonly INsfwDetector _nsfwDetector = nsfwDetector;

        public async Task Consume(ConsumeContext<CalculateQuestionNsfwScore> context)
        {
            try
            {
                _tempDirectoryManager.Create();

                List<Task<IEnumerable<NsfwScore>>> tasks = [];
                if (context.Message.Content != null)
                    tasks.Add(_nsfwDetector.ClasifyAsync(context.Message.Content, context.CancellationToken));
                foreach(var topic in context.Message.TopicNames)
                    tasks.Add(_nsfwDetector.ClasifyAsync(topic, context.CancellationToken));
                foreach(var media in context.Message.Media)
                    tasks.Add(CalculateMediaNsfw(media, context.CancellationToken));
                
                var results = await Task.WhenAll(tasks);

                _tempDirectoryManager.Delete();

                await _publishEndpoint.Publish(
                    new QuestionNsfwScoreCalculated(
                        context.Message.Id,
                        context.Message.Content != null
                            ? results[0]
                            : null,
                        context.Message.Content != null
                            ? results[1..(1 + context.Message.TopicNames.Count())]
                            : results[0..context.Message.TopicNames.Count()],
                        context.Message.Content != null
                            ? results[(1 + context.Message.TopicNames.Count())..]
                            : results[context.Message.TopicNames.Count()..]
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

        private async Task<IEnumerable<NsfwScore>> CalculateMediaNsfw(Media_CalculateQuestionNsfwScore media, CancellationToken cancellationToken)
        {
            using var inputStream = await _blobService.ReadAsync(media.ContainerName, media.BlobName, cancellationToken);
            var inputPath = await _tempDirectoryManager.AddAsync(inputStream, cancellationToken);
            var outputPath = _pathFinder.GetPath(_tempDirectoryManager.ScopeContainerName, _uniqNameGenerator.Generate());
            return await _nsfwDetector.ClasifyAsync(inputPath, outputPath, media.Type, cancellationToken);
        }
    }
}
