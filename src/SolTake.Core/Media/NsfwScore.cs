namespace SolTake.Core.Media
{
    public class NsfwScore
    {
        public double Score { get; private set; }
        public NsfwCategory Category { get; private set; }

        public NsfwScore(double score, NsfwCategory category)
        {
            Score = score;
            Category = category;
        }

        public static IEnumerable<NsfwScore> Init() =>
            [
                Harassment(1),
                HarassmentThreatening(1),
                Sexual(1),
                Hate(1),
                HateThreatening(1),
                Illicit(1),
                IllicitViolent(1),
                SelfHarmIntent(1),
                SelfHarmInstructions(1),
                SelfHarm(1),
                SexualMinors(1),
                Violence(1),
                ViolenceGraphic(1)
            ];


        public static NsfwScore Harassment(double score) => 
            new (score, NsfwCategory.Harassment);

        public static NsfwScore HarassmentThreatening(double score) =>
            new(score, NsfwCategory.HarassmentThreatening);

        public static NsfwScore Sexual(double score) =>
            new(score, NsfwCategory.Sexual);

        public static NsfwScore Hate(double score) =>
            new(score, NsfwCategory.Hate);

        public static NsfwScore HateThreatening(double score) =>
            new(score, NsfwCategory.HateThreatening);

        public static NsfwScore Illicit(double score) =>
            new(score, NsfwCategory.Illicit);

        public static NsfwScore IllicitViolent(double score) =>
            new(score, NsfwCategory.IllicitViolent);

        public static NsfwScore SelfHarmIntent(double score) =>
            new(score, NsfwCategory.SelfHarmIntent);

        public static NsfwScore SelfHarmInstructions(double score) =>
            new(score, NsfwCategory.SelfHarmInstructions);

        public static NsfwScore SelfHarm(double score) =>
            new(score, NsfwCategory.SelfHarm);

        public static NsfwScore SexualMinors(double score) =>
            new(score, NsfwCategory.SexualMinors);

        public static NsfwScore Violence(double score) =>
            new(score, NsfwCategory.Violence);

        public static NsfwScore ViolenceGraphic(double score) =>
            new(score, NsfwCategory.ViolenceGraphic);
    }
}
