namespace SolTake.Application.InfrastructureServices.IAService.Objects
{
    public class ChatGPT_TextContent(string text) : ChatGPT_Content(ChatGPT_ContentTypes.Text)
    {
        public string Text { get; private set; } = string.Join(" ", text.Split([' '], StringSplitOptions.RemoveEmptyEntries));
    }
}
