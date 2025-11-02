using MassTransit;
using SolTake.QuestionService.Domain.Abstracts;

namespace SolTake.QuestionService.Application.UseCases.SetTopicsNsfwScores
{
    internal class SetTopicsNsfwScoresHandler(IQuestionRepository questionRepository) : IConsumer<SetTopicsNsfwScores>
    {
        private readonly IQuestionRepository _questionRepository = questionRepository;

        public async Task Consume(ConsumeContext<SetTopicsNsfwScores> context)
        {
            var question = await _questionRepository.GetByIdAsync(context.Message.Id, context.CancellationToken);
            if (question == null) return;
            question.SetTopicsNsfwScores(context.Message.Scores);
            await _questionRepository.UpdateAsync(question, context.CancellationToken);
        }
    }
}
