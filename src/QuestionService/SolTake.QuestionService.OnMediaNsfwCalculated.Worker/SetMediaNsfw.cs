using MassTransit;
using MassTransit.Mediator;
using SolTake.Core.Events;
using SolTake.QuestionService.Application.ApplicationServices.SetMediaNsfwScore;

namespace SolTake.QuestionService.OnMediaNsfwCalculated.Worker
{
    public class SetMediaNsfw(IMediator mediator) : IConsumer<MediaNsfwScoreCalculatedEvent>
    {
        private readonly IMediator _mediator = mediator;

        public async Task Consume(ConsumeContext<MediaNsfwScoreCalculatedEvent> context)
        {
            if(context.Message.ContainerName == "QuestionMedia")
            {
                await _mediator.Send(
                    new SetMediaNsfwScoreDto(
                        context.Message.OwnerId,
                        context.Message.BlobName,
                        context.Message.Scores
                    ),
                    context.CancellationToken
                );
            }
        }
    }
}
