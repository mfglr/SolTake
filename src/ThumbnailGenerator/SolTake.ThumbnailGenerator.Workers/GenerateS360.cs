using MassTransit;
using MassTransit.Mediator;
using SolTake.Core.Events.MediaEvents;

namespace SolTake.ThumbnailGenerator.Workers
{
    public class GenerateS360(IMediator mediator) : IConsumer<MediaCreated>
    {
        private readonly IMediator _mediator = mediator;

        public async Task Consume(ConsumeContext<MediaCreated> context) =>
            await _mediator.Send(
                new Application.UseCases.GenerateThumbnail.GenerateThumbnail(
                    context.Message.Id,
                    context.Message.ContainerName,
                    context.Message.BlobName,
                    360,
                    true
                ),
                context.CancellationToken
            );
    }
}
