namespace SolTake.Application.Configurations
{
    public interface IChatGPTSettings
    {
        string ApiKey { get; }
        string BaseUrl { get; }
    }
}
