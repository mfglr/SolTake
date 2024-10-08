namespace MySocailApp.Application.ApplicationServices
{
    public interface IAccessTokenReader
    {
        int? GetAccountId();
        int GetRequiredAccountId();
    }
}
