using MassTransit;
using SolTake.Core.Events.MediaEvents;

namespace SolTake.MediaMetadataService.Application.UseCases.CalculateDimention
{
    internal class CalculateDimentionHandler(IDimentionCalculator dimentionCalculator, IBlobService blobService, IPublishEndpoint publishEndpoint) : IConsumer<CalculateDimention>
    {
        private readonly IDimentionCalculator _dimentionCalculator = dimentionCalculator;
        private readonly IBlobService _blobService = blobService;
        private readonly IPublishEndpoint _publishEndpoint = publishEndpoint;

        public async Task Consume(ConsumeContext<CalculateDimention> context)
        {
            using var stream = await _blobService.GetAsync(context.Message.ContainerName, context.Message.BlobName, context.CancellationToken);
            var (width, height) = await _dimentionCalculator.CalculateAsync(stream, context.CancellationToken);
            await _publishEndpoint.Publish(
                new MediaDimentionCalculated(context.Message.Id, width, height),
                context.CancellationToken
            );
        }
    }
}