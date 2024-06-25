using MySocailApp.Domain.AccountAggregate;

namespace MySocailApp.Application.Services
{
    public interface ITokenService
    {
        Task<bool> VerifyRefreshToken(Account account, string refreshToken);
        Task<Token> CreateTokenAsync(Account account);
    }
}
