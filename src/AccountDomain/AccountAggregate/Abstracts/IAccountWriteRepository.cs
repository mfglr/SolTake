using AccountDomain.ValueObjects;

namespace AccountDomain.Abstracts
{
    public interface IAccountWriteRepository
    {
        Task CreateAsync(Entities.Account account, CancellationToken cancellationToken);
        void Delete(Entities.Account account);
        Task<Entities.Account?> GetAccountAsync(int accountId, CancellationToken cancellationToken);
        Task<Entities.Account?> GetAccountByEmailAsync(Email email, CancellationToken cancellationToken);
        Task<Entities.Account?> GetAccountByUserNameAsync(UserName userName, CancellationToken cancellationToken);
        Task<Entities.Account?> GetAccountByGoogleAccount(GoogleAccount googleAccount, CancellationToken cancellationToken);
    }
}
