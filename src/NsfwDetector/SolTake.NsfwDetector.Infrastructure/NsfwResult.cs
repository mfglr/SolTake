using System.Text.Json.Serialization;

namespace SolTake.NsfwDetector.Infrastructure
{
    public class NsfwResult(List<NsfwResultItem>? results, NsfwError? error)
    {
        [JsonPropertyName("results")]
        public List<NsfwResultItem>? Results { get; private set; } = results;
        [JsonPropertyName("error")]
        public NsfwError? Error { get; private set; } = error;
    }
}
