using MassTransit;
using MassTransit.Mediator;
using SolTake.Core.Events.QuestionEvents;
using SolTake.MediaService.Application.UseCases.Create;
using SolTake.MediaService.Domain;
using System.Linq;

namespace SolTake.MediaService.Workers
{
    public class CreateMedia(IMediator mediator) : IConsumer<QuestionCreated>
    {
        private readonly IMediator _mediator = mediator;

        public async Task Consume(ConsumeContext<QuestionCreated> context) =>
            await _mediator.Send(
                new Create(context.Message.Media.Select(media => new Media_Create(
                    context.Message.Id,
                    media.Type,
                    media.ContainerName,
                    media.BlobName
                ))),
                context.CancellationToken
            );
    }
}
