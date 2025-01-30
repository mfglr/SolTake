namespace MySocailApp.Application.InfrastructureServices.IAService.Objects
{
    public class ChatGPT_ImageContent(ChatGPT_ImageUrl Image_Url) : ChatGPT_Content(ChatGPT_ContentTypes.Image_Url)
    {
        public ChatGPT_ImageUrl Image_Url { get; private set; } = Image_Url;
    }
}
