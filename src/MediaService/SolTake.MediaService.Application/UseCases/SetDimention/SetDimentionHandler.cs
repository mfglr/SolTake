using MassTransit;
using SolTake.MediaService.Domain;

namespace SolTake.MediaService.Application.UseCases.SetDimention
{
    internal class SetDimentionHandler(IMediaRepository mediaRepository) : IConsumer<SetDimention>
    {
        private readonly IMediaRepository _mediaRepository = mediaRepository;

        public async Task Consume(ConsumeContext<SetDimention> context)
        {
            var media = await _mediaRepository.GetByIdAsync(context.Message.Id, context.CancellationToken);
            if (media == null) return;
            media.SetDimention(new(context.Message.Width, context.Message.Height));
            await _mediaRepository.UpdateAsync(media, context.CancellationToken);
        }
    }
}
