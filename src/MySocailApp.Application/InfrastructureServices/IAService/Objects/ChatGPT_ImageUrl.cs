namespace MySocailApp.Application.InfrastructureServices.IAService.Objects
{
    public class ChatGPT_ImageUrl(string url, string detail)
    {
        public string Url { get; private set; } = url;
        public string Detail { get; private set; } = detail;
    }
}
