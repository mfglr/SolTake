using SolTake.Core;

namespace SolTake.Application.InfrastructureServices
{
    public interface IAccessTokenReader
    {
        int? GetAccountId();
        int GetRequiredAccountId();
        string? GetUserName();
        string? NickName();
        Multimedia? GetMedia();

        string? GetLanguage();

        Login GetLogin();

    }
}
