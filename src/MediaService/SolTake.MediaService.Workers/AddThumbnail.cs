using MassTransit;
using MassTransit.Mediator;
using SolTake.Core.Events.MediaEvents;

namespace SolTake.MediaService.Workers
{
    public class AddThumbnail(IMediator mediator) : IConsumer<ThumbnailGenerated>
    {
        private readonly IMediator _mediator = mediator;

        public async Task Consume(ConsumeContext<ThumbnailGenerated> context) =>
            await _mediator.Send(
                new Application.UseCases.AddThumbnail.AddThumbnail(
                    context.Message.Id,
                    context.Message.BlobName,
                    context.Message.Resulation,
                    context.Message.IsSquare
                ),
                context.CancellationToken
            );
    }
}
