using MassTransit;
using SolTake.QuestionService.Domain.Abstracts;

namespace SolTake.QuestionService.Application.ApplicationServices.SetMediaNsfwScore
{
    internal class SetMediaNsfwScoreHandler(IQuestionRepository questionRepository) : IConsumer<SetMediaNsfwScoreDto>
    {
        private readonly IQuestionRepository _questionRepository = questionRepository;

        public async Task Consume(ConsumeContext<SetMediaNsfwScoreDto> context)
        {
            var question = await _questionRepository.GetByIdAsync(context.Message.QuestionId, context.CancellationToken);
            if (question == null) return;
            question.SetMediaNsfwScore(context.Message.BlobName,context.Message.Scores);
            await _questionRepository.UpdateAsync(question, context.CancellationToken);
        }

    }
}
