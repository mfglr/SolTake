using MassTransit;
using MassTransit.Mediator;
using SolTake.Core.Events.MediaEvents;
using SolTake.ThumbnailGenerator.Application.UseCases.GenerateThumbnail;

namespace SolTake.ThumbnailGenerator.Workers
{
    public class GenerateP720(IMediator mediator) : IConsumer<MediaCreated>
    {
        private readonly IMediator _mediator = mediator;

        public async Task Consume(ConsumeContext<MediaCreated> context) => 
            await _mediator.Send(
                new GenerateThumbnail(
                    context.Message.Id,
                    context.Message.ContainerName,
                    context.Message.BlobName,
                    720,
                    false
                ),
                context.CancellationToken
            );
    }
}
