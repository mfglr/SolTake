using Newtonsoft.Json;

namespace SolTake.Application.InfrastructureServices.IAService.Objects
{
    public record ChatGPT_Usage(
        [JsonProperty("prompt_tokens")] int PrompTokens,
        [JsonProperty("completion_tokens")] int CompletionTokens,
        [JsonProperty("prompt_tokens_details")] ChatGPT_PromptTokenDetails PromptTokensDetails
    );
}
