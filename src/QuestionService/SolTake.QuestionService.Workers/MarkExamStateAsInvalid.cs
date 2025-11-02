using MassTransit;
using SolTake.Core.Events.QuestionEvents;
using SolTake.QuestionService.Domain.Abstracts;

namespace SolTake.QuestionService.Workers
{
    public class MarkExamStateAsInvalid(IQuestionRepository questionRepository) : IConsumer<ValidateQuestionExamFailed>
    {
        private readonly IQuestionRepository _questionRepository = questionRepository;

        public async Task Consume(ConsumeContext<ValidateQuestionExamFailed> context)
        {
            var question = await _questionRepository.GetByIdAsync(context.Message.Id, context.CancellationToken);
            if (question == null) return;
            
            if (context.Message.Reason == Reason_ValidateExamFailed.ExamNotFound)
                question.MarkExamAsInvalid();
            else
                question.MarkSubjectAsNotBelong();
            
            await _questionRepository.UpdateAsync(question,context.CancellationToken);
        }
    }
}
