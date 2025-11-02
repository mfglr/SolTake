using MassTransit;
using MassTransit.Mediator;
using SolTake.Core.Events.QuestionEvents;

namespace SolTake.QuestionService.Workers
{
    public class SetTopicsNsfwScores(IMediator mediator) : IConsumer<TopicNsfwScoresCalculated>
    {
        private readonly IMediator _mediator = mediator;

        public async Task Consume(ConsumeContext<TopicNsfwScoresCalculated> context) =>
            await _mediator.Send(
                new Application.UseCases.SetTopicsNsfwScores.SetTopicsNsfwScores(context.Message.Id, context.Message.Scores),
                context.CancellationToken
            );
    }
}
