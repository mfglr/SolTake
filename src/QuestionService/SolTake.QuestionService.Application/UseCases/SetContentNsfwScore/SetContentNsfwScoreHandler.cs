using MassTransit;
using SolTake.QuestionService.Domain.Abstracts;

namespace SolTake.QuestionService.Application.UseCases.SetContentNsfwScore
{
    internal class SetContentNsfwScoreHandler(IQuestionRepository questionRepository) : IConsumer<SetContentNsfwScore>
    {
        private readonly IQuestionRepository _questionRepository = questionRepository;

        public async Task Consume(ConsumeContext<SetContentNsfwScore> context)
        {
            var question = await _questionRepository.GetByIdAsync(context.Message.Id, context.CancellationToken);
            if (question == null) return;
            question.SetContentNsfwScores(context.Message.Scores);
            await _questionRepository.UpdateAsync(question,context.CancellationToken);
        }
    }
}
