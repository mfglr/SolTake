namespace MySocailApp.Application.InfrastructureServices
{
    public interface IAccessTokenReader
    {
        int? GetAccountId();
        int GetRequiredAccountId();
    }
}
