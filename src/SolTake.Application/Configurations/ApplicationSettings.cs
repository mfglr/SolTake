namespace SolTake.Application.Configurations
{
    public class ApplicationSettings(string applicationUrl, string apiUrl, string blobUrl) : IApplicationSettings
    {
        public string ApplicationUrl { get; private set; } = applicationUrl;
        public string ApiUrl { get; private set; } = apiUrl;
        public string BlobUrl { get; private set; } = blobUrl;
    }
}
