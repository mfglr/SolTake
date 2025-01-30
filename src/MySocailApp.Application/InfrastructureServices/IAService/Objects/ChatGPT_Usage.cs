using Newtonsoft.Json;

namespace MySocailApp.Application.InfrastructureServices.IAService.Objects
{
    public record ChatGPT_Usage([JsonProperty("prompt_tokens")] int PrompTokens, [JsonProperty("completion_tokens")] int CompletionTokens);
}
