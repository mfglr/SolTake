using Newtonsoft.Json;

namespace SolTake.Application.InfrastructureServices.IAService.Objects
{
    public record ChatGPT_PromptTokenDetails(
        [JsonProperty("cached_tokens")] int CahcedTokens,
        [JsonProperty("audio_tokens")] int AudioTokens
    );
}
