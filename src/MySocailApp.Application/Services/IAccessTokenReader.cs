namespace MySocailApp.Application.Services
{
    public interface IAccessTokenReader
    {
        int? GetAccountId();
        int GetRequiredAccountId();
        string GetRequiredUserName();
        string GetRequiredEmail();
    }
}
