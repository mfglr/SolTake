using System.Text.Json.Serialization;

namespace SolTake.NsfwDetector.Infrastructure
{
    public class NsfwCategoryResult(bool harassment, bool harassmentThreatening, bool sexual, bool hate, bool hateThreatening, bool illicit, bool illicitViolent,  bool selfHarmIntent, bool selfHarmInstructions, bool selfHarm, bool sexualMinors, bool violence, bool violenceGraphic)
    {
        [JsonPropertyName("harassment")]
        public bool Harassment { get; private set; } = harassment;

        [JsonPropertyName("harassment/threatening")]
        public bool HarassmentThreatening { get; private set; } = harassmentThreatening;

        [JsonPropertyName("sexual")]
        public bool Sexual { get; private set; } = sexual;

        [JsonPropertyName("hate")]
        public bool Hate { get; private set; } = hate;

        [JsonPropertyName("hate/threatening")]
        public bool HateThreatening { get; private set; } = hateThreatening;

        [JsonPropertyName("illicit")]
        public bool Illicit { get; private set; } = illicit;

        [JsonPropertyName("illicit/violent")]
        public bool IllicitViolent { get; private set; } = illicitViolent;

        [JsonPropertyName("self-harm/intent")]
        public bool SelfHarmIntent { get; private set; } = selfHarmIntent;

        [JsonPropertyName("self-harm/instructions")]
        public bool SelfHarmInstructions { get; private set; } = selfHarmInstructions;

        [JsonPropertyName("self-harm")]
        public bool SelfHarm { get; private set; } = selfHarm;

        [JsonPropertyName("sexual/minors")]
        public bool SexualMinors { get; private set; } = sexualMinors;

        [JsonPropertyName("violence")]
        public bool Violence { get; private set; } = violence;

        [JsonPropertyName("violence/graphic")]
        public bool ViolenceGraphic { get; private set; } = violenceGraphic;
    }
}
