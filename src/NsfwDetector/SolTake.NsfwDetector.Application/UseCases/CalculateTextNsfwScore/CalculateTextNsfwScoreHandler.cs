using MassTransit;

namespace SolTake.NsfwDetector.Application.UseCases.CalculateTextNsfwScore
{
    internal class CalculateTextNsfwScoreHandler(INsfwDetector nsfwDetector) : IConsumer<CalculateTextNsfwScore>
    {
        private readonly INsfwDetector _nsfwDetector = nsfwDetector;

        public async Task Consume(ConsumeContext<CalculateTextNsfwScore> context)
        {
            var nsfwScore = await _nsfwDetector.ClasifyAsync(context.Message.Text, context.CancellationToken);
            await context.RespondAsync(new CalculateTextNsfwScoreResponse(nsfwScore));
        }
    }
}
