namespace MySocailApp.Application.Services
{
    public interface IAccessTokenReader
    {
        string? GetAccountId();
        string GetRequiredAccountId();
        string GetRequiredUserName();
        string GetRequiredEmail();
    }
}
