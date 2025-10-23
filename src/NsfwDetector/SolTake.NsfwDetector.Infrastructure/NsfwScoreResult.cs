using System.Text.Json.Serialization;

namespace SolTake.NsfwDetector.Infrastructure
{
    public class NsfwScoreResult(double harassment, double harassmentThreatening, double sexual, double hate, double hateThreatening, double illicit, double illicitViolent, double selfHarmIntent, double selfHarmInstructions, double selfHarm, double sexualMinors, double violence, double violenceGraphic)
    {
        [JsonPropertyName("harassment")]
        public double Harassment { get; private set; } = harassment;

        [JsonPropertyName("harassment/threatening")]
        public double HarassmentThreatening { get; private set; } = harassmentThreatening;

        [JsonPropertyName("sexual")]
        public double Sexual { get; private set; } = sexual;

        [JsonPropertyName("hate")]
        public double Hate { get; private set; } = hate;

        [JsonPropertyName("hate/threatening")]
        public double HateThreatening { get; private set; } = hateThreatening;

        [JsonPropertyName("illicit")]
        public double Illicit { get; private set; } = illicit;

        [JsonPropertyName("illicit/violent")]
        public double IllicitViolent { get; private set; } = illicitViolent;

        [JsonPropertyName("self-harm/intent")]
        public double SelfHarmIntent { get; private set; } = selfHarmIntent;

        [JsonPropertyName("self-harm/instructions")]
        public double SelfHarmInstructions { get; private set; } = selfHarmInstructions;

        [JsonPropertyName("self-harm")]
        public double SelfHarm { get; private set; } = selfHarm;

        [JsonPropertyName("sexual/minors")]
        public double SexualMinors { get; private set; } = sexualMinors;

        [JsonPropertyName("violence")]
        public double Violence { get; private set; } = violence;

        [JsonPropertyName("violence/graphic")]
        public double ViolenceGraphic { get; private set; } = violenceGraphic;
    }
}
