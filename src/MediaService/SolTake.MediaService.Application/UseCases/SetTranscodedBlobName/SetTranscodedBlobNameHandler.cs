using MassTransit;
using SolTake.MediaService.Domain;

namespace SolTake.MediaService.Application.UseCases.SetTranscodedBlobName
{
    internal class SetTranscodedBlobNameHandler(IMediaRepository mediaRepository) : IConsumer<SetTranscodedBlobName>
    {
        private readonly IMediaRepository _mediaRepository = mediaRepository;

        public async Task Consume(ConsumeContext<SetTranscodedBlobName> context)
        {
            var media = await _mediaRepository.GetByIdAsync(context.Message.Id, context.CancellationToken);
            if (media == null) return;
            media.SetTranscodedBlobName(context.Message.BlobName);
            await _mediaRepository.UpdateAsync(media, context.CancellationToken);
        }
    }
}
