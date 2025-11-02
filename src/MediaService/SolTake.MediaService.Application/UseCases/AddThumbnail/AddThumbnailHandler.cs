using MassTransit;
using SolTake.MediaService.Domain;

namespace SolTake.MediaService.Application.UseCases.AddThumbnail
{
    internal class AddThumbnailHandler(IMediaRepository mediaRepository) : IConsumer<AddThumbnail>
    {
        private readonly IMediaRepository _mediaRepository = mediaRepository;

        public async Task Consume(ConsumeContext<AddThumbnail> context)
        {
            var media = await _mediaRepository.GetByIdAsync(context.Message.Id, context.CancellationToken);
            if (media == null) return;
            var thumbnail = new Thumbnail(context.Message.BlobName,context.Message.Resulation,context.Message.IsSquare);
            media.AddThumbnail(thumbnail);
            await _mediaRepository.UpdateAsync(media,context.CancellationToken);
        }
    }
}
