using MassTransit;
using SolTake.Core.Events.QuestionEvents;
using SolTake.QuestionService.Domain.Abstracts;

namespace SolTake.QuestionService.Application.UseCases.MarkedQuestionAsDraft
{
    internal class MarkedQuestionAsDraftHandler(IQuestionRepository questionRepository, IPublishEndpoint publishEndpoint) : IConsumer<MarkedQuestionAsDraftDto>
    {
        private readonly IQuestionRepository _questionRepository = questionRepository;
        private readonly IPublishEndpoint _publishEndpoint = publishEndpoint;

        public async Task Consume(ConsumeContext<MarkedQuestionAsDraftDto> context)
        {
            var question =
                await _questionRepository.GetByIdAsync(context.Message.QuestionId, context.CancellationToken) ??
                throw new QuestionNotFoundException();
            question.MarkAsDraft();
            await _questionRepository.UpdateAsync(question, context.CancellationToken);
            await _publishEndpoint.Publish(new QuestionMarkedAsDraftEvent(context.Message.QuestionId), context.CancellationToken);
        }
    }
}
