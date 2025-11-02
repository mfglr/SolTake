using MassTransit;
using MassTransit.Mediator;
using SolTake.Core.Events.QuestionEvents;
using SolTake.NsfwDetector.Application.UseCases.CalculateTextNsfwScore;

namespace SolTake.NsfwDetector.Workers
{
    internal class CalculateQuestionContentNsfwScores(IMediator mediator, IPublishEndpoint publishEndpoint) : IConsumer<QuestionCreated>
    {
        private readonly IMediator _mediator = mediator;
        private readonly IPublishEndpoint _publishEndpoint = publishEndpoint;

        public async Task Consume(ConsumeContext<QuestionCreated> context)
        {
            if (context.Message.Content == null) return;

            var client = _mediator.CreateRequestClient<CalculateTextNsfwScore>();
            var response = await client.GetResponse<CalculateTextNsfwScoreResponse>(
                new CalculateTextNsfwScore(context.Message.Content),
                context.CancellationToken
            );
            await _publishEndpoint.Publish(
                new QuestionContentNsfwScoreCalculated(context.Message.Id, response.Message.Scores),
                context.CancellationToken
            );
        }
    }
}
