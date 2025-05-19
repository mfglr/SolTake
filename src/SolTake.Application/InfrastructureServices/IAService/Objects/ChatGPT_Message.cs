namespace MySocailApp.Application.InfrastructureServices.IAService.Objects
{
    public class ChatGPT_Message(string role, IEnumerable<ChatGPT_Content> content)
    {
        public string Role { get; private set; } = role;
        public IEnumerable<ChatGPT_Content> Content { get; private set; } = content;
    }
}
