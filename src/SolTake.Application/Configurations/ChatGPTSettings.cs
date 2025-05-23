namespace SolTake.Application.Configurations
{
    public class ChatGPTSettings(string apiKey,string baseUrl) : IChatGPTSettings
    {
        public string ApiKey { get; private set; } = apiKey;
        public string BaseUrl { get; private set; } = baseUrl;
    }
}
