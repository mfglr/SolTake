using SolTake.Core.Media;

namespace SolTake.Core.Events.QuestionEvents
{
    public record TopicNsfwScoresCalculated(Guid Id, IEnumerable<IEnumerable<NsfwScore>> Scores);
}
