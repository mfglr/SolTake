using MassTransit;
using MassTransit.Mediator;
using SolTake.Core.Events.MediaEvents;
using SolTake.MediaService.Application.UseCases.SetNsfwScores;

namespace SolTake.MediaService.Workers
{
    public class SetNsfwScores(IMediator mediator) : IConsumer<MediaNsfwScoresCalculated>
    {
        private readonly IMediator _mediator = mediator;

        public async Task Consume(ConsumeContext<MediaNsfwScoresCalculated> context) =>
            await _mediator.Send(
                new Application.UseCases.SetNsfwScores.SetNsfwScores(
                    context.Message.Id,
                    context.Message.Scores
                ),
                context.CancellationToken
            );
    }
}
