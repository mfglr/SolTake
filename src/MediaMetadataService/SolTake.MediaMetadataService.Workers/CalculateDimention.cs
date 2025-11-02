using MassTransit;
using MassTransit.Mediator;
using SolTake.Core.Events.MediaEvents;

namespace SolTake.MediaMetadataService.Workers
{
    public class CalculateDimention(IMediator mediator) : IConsumer<MediaCreated>
    {
        private readonly IMediator _mediator = mediator;

        public async Task Consume(ConsumeContext<MediaCreated> context) =>
            await _mediator.Send(
                new Application.UseCases.CalculateDimention.CalculateDimention(
                    context.Message.Id,
                    context.Message.ContainerName,
                    context.Message.BlobName
                ),
                context.CancellationToken
            );
    }
}
