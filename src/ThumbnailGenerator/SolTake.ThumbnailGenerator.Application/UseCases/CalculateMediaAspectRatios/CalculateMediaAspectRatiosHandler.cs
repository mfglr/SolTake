using MassTransit;
using SolTake.Core;

namespace SolTake.ThumbnailGenerator.Application.UseCases.CalculateMediaAspectRatios
{
    internal class CalculateMediaAspectRatiosHandler(IDimentionCalculator dimentionCalculator, IBlobService blobService) : IConsumer<CalculateMediaAspectRatios>
    {
        private readonly IDimentionCalculator _dimentionCalculator = dimentionCalculator;
        private readonly IBlobService _blobService = blobService;

        public async Task Consume(ConsumeContext<CalculateMediaAspectRatios> context)
        {
            var tasks = context.Message.Media.Select(media => CalculateDimention(media, context.CancellationToken));
            var dimentions = await Task.WhenAll(tasks);
            await context.RespondAsync(new CalculateMediaAspectRatiosResponse(dimentions));
        }

        private async Task<Dimention> CalculateDimention(Media_CalculateMediaAspectRatios media, CancellationToken cancellationToken)
        {
            using var stream = await _blobService.GetAsync(media.ContainerName, media.BlobName, cancellationToken);
            return await _dimentionCalculator.CalculateAsync(stream, cancellationToken);
        }
    }
}
