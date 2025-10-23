using MassTransit;
using MassTransit.Mediator;
using SolTake.Core.Events;
using SolTake.Core.Media;
using SolTake.MediaManipulator.Application.ApplicationServices.ManipulateVideo;

namespace SolTake.MediaManipulator.Worker
{
    public class ManipulateMedia(IMediator mediator) : IConsumer<MediaUploadedEvent>
    {
        private readonly IMediator _mediator = mediator;

        public async Task Consume(ConsumeContext<MediaUploadedEvent> context)
        {
            if(context.Message.Type == MediaType.Video)
                await _mediator.Send(new ManipulateVideoDto(context.Message.ContainerName, context.Message.BlobName), context.CancellationToken);
        }
    }
}
