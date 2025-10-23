using MassTransit;
using MassTransit.Mediator;
using SolTake.Core.Events;
using SolTake.NsfwDetector.Application.ApplicationServices.CalculateMediaNsfwScore;

namespace SolTake.NsfwDetector.Worker.OnMediaUploaded
{
    public class CalculateNsfwScores(IMediator mediator) : IConsumer<MediaUploadedEvent>
    {
        private readonly IMediator _mediator = mediator;

        public Task Consume(ConsumeContext<MediaUploadedEvent> context) =>
            _mediator.Send(
                new CalculateMediaNsfwScoreDto(
                    context.Message.OwnerId,
                    context.Message.ContainerName,
                    context.Message.BlobName,
                    context.Message.Type
                ),
                context.CancellationToken
            );
    }
}
