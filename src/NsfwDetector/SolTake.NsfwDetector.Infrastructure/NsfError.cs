using System.Text.Json.Serialization;

namespace SolTake.NsfwDetector.Infrastructure
{
    public class NsfError(string message)
    {
        [JsonPropertyName("message")]
        public string Message { get; private set; } = message;
    }
}
