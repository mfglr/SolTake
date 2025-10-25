using SolTake.Core.Media;

namespace SolTake.Core.Events.QuestionEvents
{
    public record QuestionNsfwScoreCalculated(
        Guid Id,
        IEnumerable<NsfwScore>? ContentScore,
        IEnumerable<IEnumerable<NsfwScore>> TopicsScore,
        IEnumerable<IEnumerable<NsfwScore>> MediScores
    );
}
