namespace MySocailApp.Domain.AccountAggregate
{
    public interface ITokenService
    {
        Task<bool> VerifyRefreshToken(Account account, string refreshToken);
        Task UpdateTokenAsync(Account account);
    }
}
