using MassTransit;
using MassTransit.Mediator;
using SolTake.Core.Events.QuestionEvents;
using SolTake.NsfwDetector.Application.UseCases.CalculateTextNsfwScore;

namespace SolTake.NsfwDetector.Workers
{
    public class CalculateTopicsNsfwScores(IMediator mediator, IPublishEndpoint publishEndpoint) : IConsumer<QuestionCreated>
    {
        private readonly IMediator _mediator = mediator;
        private readonly IPublishEndpoint _publishEndpoint = publishEndpoint;

        public async Task Consume(ConsumeContext<QuestionCreated> context)
        {
            if (!context.Message.TopicNames.Any()) return;

            var client = _mediator.CreateRequestClient<CalculateTextNsfwScore>();
            var response = await client.GetResponse<CalculateTextNsfwScoreResponse>(new CalculateTextNsfwScore(context.Message.TopicNames.First()));
            await _publishEndpoint.Publish(
                new TopicNsfwScoresCalculated(context.Message.Id, [response.Message.Scores]),
                context.CancellationToken
            );

            //var tasks = context.Message.TopicNames.Select(x => client.GetResponse<CalculateTextNsfwScoreResponse>(new CalculateTextNsfwScore(x)));
            //var results = await Task.WhenAll(tasks);
            //await _publishEndpoint.Publish(
            //    new TopicNsfwScoresCalculated(context.Message.Id, results.Select(x => x.Message.Scores)),
            //    context.CancellationToken
            //);


        }
    }
}
