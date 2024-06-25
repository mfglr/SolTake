namespace MySocailApp.Application.Configurations
{
    public class ApplicationSettings(string applicationUrl) : IApplicationSettings
    {
        public string ApplicationUrl { get; private set; } = applicationUrl;
    }
}
