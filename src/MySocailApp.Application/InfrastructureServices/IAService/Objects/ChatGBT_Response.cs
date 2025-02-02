namespace MySocailApp.Application.InfrastructureServices.IAService.Objects
{
    public record ChatGBT_Response(IEnumerable<ChatGPT_Choice> Choices, ChatGPT_Usage Usage, ChatGPT_Error? Error);
}
