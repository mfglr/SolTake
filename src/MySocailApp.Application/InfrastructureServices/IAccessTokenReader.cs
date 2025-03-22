using MySocailApp.Core;

namespace MySocailApp.Application.InfrastructureServices
{
    public interface IAccessTokenReader
    {
        int? GetAccountId();
        int GetRequiredAccountId();

        string? GetUserName();
        string? NickName();
        Multimedia? GetMedia();
    }
}
