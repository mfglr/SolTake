using MassTransit;
using SolTake.Core.Events.QuestionEvents;
using SolTake.QuestionService.Domain.Abstracts;

namespace SolTake.QuestionService.Workers
{
    public class MarkExamStateAsValid(IQuestionRepository questionRepository) : IConsumer<ValidateQuestionExamSuccess>
    {
        private readonly IQuestionRepository _questionRepository = questionRepository;

        public async Task Consume(ConsumeContext<ValidateQuestionExamSuccess> context)
        {
            var question = await _questionRepository.GetByIdAsync(context.Message.Id, context.CancellationToken);
            if (question == null) return;
            question.MarkExamAsValid();
            await _questionRepository.UpdateAsync(question, context.CancellationToken);
        }

    }
}
