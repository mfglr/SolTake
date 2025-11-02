using MassTransit;
using MassTransit.Mediator;
using SolTake.Core.Events.QuestionEvents;

namespace SolTake.QuestionService.Workers
{
    public class SetContentNsfwScore(IMediator mediator) : IConsumer<QuestionContentNsfwScoreCalculated>
    {
        private readonly IMediator _mediator = mediator;

        public async Task Consume(ConsumeContext<QuestionContentNsfwScoreCalculated> context) =>
            await _mediator.Send(
                new Application.UseCases.SetContentNsfwScore.SetContentNsfwScore(
                    context.Message.Id,
                    context.Message.Scores
                ),
                context.CancellationToken
            );
    }
}
