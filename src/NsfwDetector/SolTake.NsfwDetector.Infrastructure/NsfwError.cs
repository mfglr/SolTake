using System.Text.Json.Serialization;

namespace SolTake.NsfwDetector.Infrastructure
{
    public class NsfwError(string message)
    {
        [JsonPropertyName("message")]
        public string Message { get; private set; } = message;
    }
}
