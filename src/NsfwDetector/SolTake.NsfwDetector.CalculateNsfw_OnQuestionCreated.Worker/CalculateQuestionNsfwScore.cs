using MassTransit;
using MassTransit.Mediator;
using SolTake.Core.Events.QuestionEvents;
using SolTake.NsfwDetector.Application.UseCases.CalculateQuestionNsfwScore;

namespace SolTake.NsfwDetector.CalculateNsfw_OnQuestionCreated.Worker
{
    public class CalculateQuestionNsfwScore(IMediator mediator) : IConsumer<QuestionCreated>
    {
        private readonly IMediator _mediator = mediator;

        public Task Consume(ConsumeContext<QuestionCreated> context) =>
            _mediator.Send(
                new Application.UseCases.CalculateQuestionNsfwScore.CalculateQuestionNsfwScore(
                    context.Message.Id,
                    context.Message.Content,
                    context.Message.TopicNames,
                    context.Message.Media.Select(x => new Media_CalculateQuestionNsfwScore(x.ContainerName, x.BlobName, x.Type))
                ),
                context.CancellationToken
            );
    }
}
