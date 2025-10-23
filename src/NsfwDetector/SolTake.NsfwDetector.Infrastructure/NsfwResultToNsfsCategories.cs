using SolTake.Core.Media;

namespace SolTake.NsfwDetector.Infrastructure
{
    internal class NsfwResultToNsfsCategories
    {
        public IEnumerable<NsfwScore> Map(NsfwScoreResult scores) =>
            [
                NsfwScore.Harassment(scores.Harassment),
                NsfwScore.HarassmentThreatening(scores.HarassmentThreatening),
                NsfwScore.Sexual(scores.Sexual),
                NsfwScore.Hate(scores.Hate),
                NsfwScore.HateThreatening(scores.HateThreatening),
                NsfwScore.Illicit(scores.Illicit),
                NsfwScore.IllicitViolent(scores.IllicitViolent),
                NsfwScore.SelfHarmIntent(scores.SelfHarmIntent),
                NsfwScore.SelfHarmInstructions(scores.SelfHarmInstructions),
                NsfwScore.SelfHarm(scores.SelfHarm),
                NsfwScore.SexualMinors(scores.SexualMinors),
                NsfwScore.Violence(scores.Violence),
                NsfwScore.ViolenceGraphic(scores.ViolenceGraphic),
            ];
                
    }
}
