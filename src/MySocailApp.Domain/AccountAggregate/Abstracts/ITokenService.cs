using MySocailApp.Domain.AccountAggregate.Entities;

namespace MySocailApp.Domain.AccountAggregate.Abstracts
{
    public interface ITokenService
    {
        Task<bool> VerifyRefreshToken(Account account, string refreshToken);
        Task UpdateTokenAsync(Account account);
    }
}
