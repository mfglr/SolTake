using SolTake.Core.Media;

namespace SolTake.Core.Events.QuestionEvents
{
    public record QuestionContentNsfwScoreCalculated(Guid Id, IEnumerable<NsfwScore> Scores);
}
