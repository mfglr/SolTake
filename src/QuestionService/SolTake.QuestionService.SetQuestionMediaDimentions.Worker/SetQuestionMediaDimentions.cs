using MassTransit;
using MassTransit.Mediator;
using SolTake.Core.Events.QuestionEvents;
using SolTake.QuestionService.Application.UseCases.SetMediaDimentions;

namespace SolTake.QuestionService.SetQuestionMediaDimentions.Worker
{
    public class SetQuestionMediaDimentions(IMediator mediator) : IConsumer<QuestionMediaDimentionCalculated>
    {
        private readonly IMediator _mediator = mediator;

        public async Task Consume(ConsumeContext<QuestionMediaDimentionCalculated> context) =>
            await _mediator.Send(
                new SetMediaDimentions(context.Message.Id, context.Message.Dimentions),
                context.CancellationToken
            );
    }
}
