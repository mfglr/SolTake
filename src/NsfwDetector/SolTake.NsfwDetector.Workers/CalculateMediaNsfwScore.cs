using MassTransit;
using MassTransit.Mediator;
using SolTake.Core.Events.MediaEvents;

namespace SolTake.NsfwDetector.Workers
{
    public class CalculateMediaNsfwScore(IMediator mediator) : IConsumer<MediaCreated>
    {
        private readonly IMediator _mediator = mediator;

        public async Task Consume(ConsumeContext<MediaCreated> context) =>
            await _mediator.Send(
                new Application.UseCases.CalculateMediaNsfwScore.CalculateMediaNsfwScore(
                    context.Message.Id,
                    context.Message.Type,
                    context.Message.ContainerName,
                    context.Message.BlobName
                ),
                context.CancellationToken
            );
    }
}
