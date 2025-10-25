using SolTake.Core.Media;

namespace SolTake.QuestionService.Application.UseCases.SetQuestionNsfwScores
{
    public record SetQuestionNsfwScores(Guid Id, IEnumerable<NsfwScore>? ContentScores, IEnumerable<IEnumerable<NsfwScore>> TopicScores, IEnumerable<IEnumerable<NsfwScore>> MediaScores);
}
