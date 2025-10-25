using MassTransit;
using MassTransit.Mediator;
using SolTake.Core.Events;
using SolTake.ThumbnailGenerator.Application.UseCases.GenerateThumbnail;

namespace SolTake.ThumbnailGenerator.Generate360Square_OnMediaUploaded.Worker
{
    public class Generate360Square(IMediator mediator) : IConsumer<MediaUploadedEvent>
    {
        private readonly IMediator _mediator = mediator;

        public Task Consume(ConsumeContext<MediaUploadedEvent> context)
            => _mediator.Send(
                new GenerateThumbnailDto(context.Message.ContainerName, context.Message.BlobName, 360, true),
                context.CancellationToken
            );
    }
}
