using MassTransit;
using MassTransit.Mediator;
using SolTake.Core.Events.MediaEvents;

namespace SolTake.MediaService.Workers
{
    public class SetTranscodedBlobName(IMediator mediator) : IConsumer<VideoTranscoded>
    {
        private readonly IMediator _mediator = mediator;

        public async Task Consume(ConsumeContext<VideoTranscoded> context) =>
            await _mediator.Send(
                new Application.UseCases.SetTranscodedBlobName.SetTranscodedBlobName(
                    context.Message.Id,
                    context.Message.BlobName
                ),
                context.CancellationToken
            );
    }
}
