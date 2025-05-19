namespace MySocailApp.Application.Configurations
{
    public interface IApplicationSettings
    {
        string ApplicationUrl { get; }
        string ApiUrl { get; }
        string BlobUrl { get; }
    }
}
