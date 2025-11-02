using MassTransit;
using SolTake.Core.Events.QuestionEvents;
using SolTake.QuestionService.Domain.Abstracts;

namespace SolTake.QuestionService.Workers
{
    public class MarkSubjectStateAsValid(IQuestionRepository questionRepository) : IConsumer<ValidateQuestionSubjectSuccess>
    {
        private readonly IQuestionRepository _questionRepository = questionRepository;

        public async Task Consume(ConsumeContext<ValidateQuestionSubjectSuccess> context)
        {
            var question = await _questionRepository.GetByIdAsync(context.Message.Id, context.CancellationToken);
            if (question == null) return;
            question.MarkSubjectAsValid();
            await _questionRepository.UpdateAsync(question, context.CancellationToken);
        }
    }
}
