using SolTake.Core.Media;

namespace SolTake.Core.Events.MediaEvents
{
    public enum NsfwCategory_NsfwScore_MediaNsfwScoresCalculated
    {
        Harassment,
        HarassmentThreatening,
        Sexual,
        Hate,
        HateThreatening,
        Illicit,
        IllicitViolent,
        SelfHarmIntent,
        SelfHarmInstructions,
        SelfHarm,
        SexualMinors,
        Violence,
        ViolenceGraphic
    }

    public record NsfwScore_MediaNsfwScoresCalculated(
        double Score,
        IEnumerable<NsfwCategory_NsfwScore_MediaNsfwScoresCalculated> Category
    );

    public record MediaNsfwScoresCalculated(
        Guid Id,
        IEnumerable<NsfwScore> Scores
    );
}
