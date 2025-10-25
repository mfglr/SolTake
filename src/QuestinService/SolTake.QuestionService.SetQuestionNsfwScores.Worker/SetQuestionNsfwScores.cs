using MassTransit;
using MassTransit.Mediator;
using SolTake.Core.Events.QuestionEvents;

namespace SolTake.QuestionService.SetQuestionNsfwScores.Worker
{
    public class SetQuestionNsfwScores(IMediator mediator) : IConsumer<QuestionNsfwScoreCalculated>
    {
        private readonly IMediator _mediator = mediator;

        public Task Consume(ConsumeContext<QuestionNsfwScoreCalculated> context) =>
            _mediator.Send(
                new Application.UseCases.SetQuestionNsfwScores.SetQuestionNsfwScores(
                    context.Message.Id,
                    context.Message.ContentScore,
                    context.Message.TopicsScore,
                    context.Message.MediScores
                ),
                context.CancellationToken
            );
    }
}
