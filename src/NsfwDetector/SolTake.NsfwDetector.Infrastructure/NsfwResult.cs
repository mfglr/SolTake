using System.Text.Json.Serialization;

namespace SolTake.NsfwDetector.Infrastructure
{
    public class NsfwResult(List<NsfwResultItem>? results, NsfError? error)
    {
        [JsonPropertyName("results")]
        public List<NsfwResultItem>? Results { get; private set; } = results;
        [JsonPropertyName("error")]
        public NsfError? Error { get; private set; } = error;
    }
}
