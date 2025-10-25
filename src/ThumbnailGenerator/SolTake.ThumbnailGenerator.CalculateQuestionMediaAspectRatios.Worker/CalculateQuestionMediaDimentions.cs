using MassTransit;
using MassTransit.Mediator;
using SolTake.Core.Events.QuestionEvents;
using SolTake.ThumbnailGenerator.Application.UseCases.CalculateMediaAspectRatios;

namespace SolTake.ThumbnailGenerator.CalculateQuestionMediaAspectRatios.Worker
{
    public class CalculateQuestionMediaDimentions(IMediator mediator, IPublishEndpoint publishEndpoint) : IConsumer<QuestionCreated>
    {
        private readonly IMediator _mediator = mediator;
        private readonly IPublishEndpoint _publishEndpoint = publishEndpoint;
        public async Task Consume(ConsumeContext<QuestionCreated> context)
        {
            var client = _mediator.CreateRequestClient<CalculateMediaAspectRatios>();
            var response = await client.GetResponse<CalculateMediaAspectRatiosResponse>(
                new CalculateMediaAspectRatios(
                    context.Message.Media.Select(
                        x => new Media_CalculateMediaAspectRatios(
                            x.ContainerName,
                            x.BlobName
                        )
                    )
                )
            );
            await _publishEndpoint.Publish(
                new QuestionMediaDimentionCalculated(
                    context.Message.Id,
                    response.Message.Dimentions
                ),
                context.CancellationToken
            );

        }
    }
}
