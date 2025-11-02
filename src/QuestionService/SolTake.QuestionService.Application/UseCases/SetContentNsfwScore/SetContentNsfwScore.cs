using SolTake.Core.Media;

namespace SolTake.QuestionService.Application.UseCases.SetContentNsfwScore
{
    public record SetContentNsfwScore(Guid Id, IEnumerable<NsfwScore> Scores);
}
