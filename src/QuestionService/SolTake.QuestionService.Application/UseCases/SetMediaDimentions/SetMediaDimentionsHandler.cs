using MassTransit;
using SolTake.QuestionService.Domain.Abstracts;

namespace SolTake.QuestionService.Application.UseCases.SetMediaDimentions
{
    internal class SetMediaDimentionsHandler(IQuestionRepository questionRepository) : IConsumer<SetMediaDimentions>
    {
        private readonly IQuestionRepository _questionRepository = questionRepository;

        public async Task Consume(ConsumeContext<SetMediaDimentions> context)
        {
            var question = await _questionRepository.GetByIdAsync(context.Message.Id, context.CancellationToken);
            if (question == null) return;
            question.SetMediaDimentions(context.Message.Dimentions);
            await _questionRepository.UpdateAsync(question, context.CancellationToken);
        }
    }
}
