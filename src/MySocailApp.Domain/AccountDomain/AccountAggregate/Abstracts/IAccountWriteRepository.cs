using MySocailApp.Domain.AccountDomain.AccountAggregate.Entities;
using MySocailApp.Domain.AccountDomain.AccountAggregate.ValueObjects;

namespace MySocailApp.Domain.AccountDomain.AccountAggregate.Abstracts
{
    public interface IAccountWriteRepository
    {
        Task CreateAsync(Account account,CancellationToken cancellationToken);
        void Delete(Account account);
        Task<Account?> GetAccountAsync(int accountId, CancellationToken cancellationToken);
        Task<Account?> GetAccountByEmailAsync(Email email, CancellationToken cancellationToken);
        Task<Account?> GetAccountByUserNameAsync(UserName userName, CancellationToken cancellationToken);
        Task<Account?> GetAccountByGoogleAccount(GoogleAccount googleAccount,CancellationToken cancellationToken);
    }
}
