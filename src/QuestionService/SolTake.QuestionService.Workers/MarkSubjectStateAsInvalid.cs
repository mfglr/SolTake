using MassTransit;
using SolTake.Core.Events.QuestionEvents;
using SolTake.QuestionService.Domain.Abstracts;

namespace SolTake.QuestionService.Workers
{
    public class MarkSubjectStateAsInvalid(IQuestionRepository questionRepository) : IConsumer<ValidateQuestionSubjectFailed>
    {
        private readonly IQuestionRepository _questionRepository = questionRepository;

        public async Task Consume(ConsumeContext<ValidateQuestionSubjectFailed> context)
        {
            var question = await _questionRepository.GetByIdAsync(context.Message.Id, context.CancellationToken);
            if (question == null) return;
            question.MarkSubjectAsNotFound();
            await _questionRepository.UpdateAsync(question, context.CancellationToken);
        }
    }
}
