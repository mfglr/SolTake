using MassTransit;
using MassTransit.Mediator;
using SolTake.Core.Events.MediaEvents;

namespace SolTake.MediaService.Workers
{
    public class SetDimention(IMediator mediator) : IConsumer<MediaDimentionCalculated>
    {
        private readonly IMediator _mediator = mediator;

        public async Task Consume(ConsumeContext<MediaDimentionCalculated> context) =>
            await _mediator.Send(
                new Application.UseCases.SetDimention.SetDimention(
                    context.Message.Id,
                    context.Message.Width,
                    context.Message.Height
                ),
                context.CancellationToken
            );
    }
}
