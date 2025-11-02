using MassTransit;
using SolTake.Core.Events.MediaEvents;
using SolTake.MediaService.Domain;

namespace SolTake.MediaService.Application.UseCases.Create
{
    internal class CreateHandler(IMediaRepository mediaRepository, IPublishEndpoint publishEndpoint) : IConsumer<Create>
    {
        private readonly IMediaRepository _mediaRepository = mediaRepository;
        private readonly IPublishEndpoint _publishEndpoint = publishEndpoint;

        public async Task Consume(ConsumeContext<Create> context)
        {
            var media = context.Message.Media.Select(media => new Media(media.Type, media.OwnerId, media.ContainerName, media.BlobName)).ToList();
            foreach (var mediaItem in media)
                mediaItem.Create();

            await _mediaRepository.CreateManyAsync(media, context.CancellationToken);
            
            foreach(var mediaItem in media)
                await _publishEndpoint.Publish(
                    new MediaCreated(
                        mediaItem.Id,
                        mediaItem.OwnerId,
                        mediaItem.Type,
                        mediaItem.ContainerName,
                        mediaItem.BlobName
                    ),
                    context.CancellationToken
                );
        }
    }
}
