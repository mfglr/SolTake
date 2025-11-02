using MassTransit;
using MassTransit.Mediator;
using SolTake.Core.Events.MediaEvents;
using SolTake.Core.Media;

namespace SolTake.VideoTranscodingService.Workers
{
    public class Transcode(IMediator mediator) : IConsumer<MediaCreated>
    {
        private readonly IMediator _mediator = mediator;

        public async Task Consume(ConsumeContext<MediaCreated> context)
        {
            if (context.Message.Type == MediaType.Image) return;

            await _mediator.Send(
                new Application.UseCases.Transcode.Transcode(
                    context.Message.Id,
                    context.Message.ContainerName,
                    context.Message.BlobName
                ),
                context.CancellationToken
            );
        }
            
    }
}
