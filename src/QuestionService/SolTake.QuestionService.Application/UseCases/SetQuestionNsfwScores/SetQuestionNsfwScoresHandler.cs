using MassTransit;
using SolTake.QuestionService.Domain.Abstracts;

namespace SolTake.QuestionService.Application.UseCases.SetQuestionNsfwScores
{
    internal class SetQuestionNsfwScoresHandler(IQuestionRepository questionRepository) : IConsumer<SetQuestionNsfwScores>
    {
        private readonly IQuestionRepository _questionRepository = questionRepository;

        public async Task Consume(ConsumeContext<SetQuestionNsfwScores> context)
        {
            var question = await _questionRepository.GetByIdAsync(context.Message.Id, context.CancellationToken);
            if (question == null) return;
            question.SetNsfwScores(context.Message.ContentScores, context.Message.TopicScores, context.Message.MediaScores);
            await _questionRepository.UpdateAsync(question, context.CancellationToken);
        }
    }
}
