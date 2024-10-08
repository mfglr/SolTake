using MySocailApp.Domain.AccountAggregate.Entities;

namespace MySocailApp.Domain.AccountAggregate.Abstracts
{
    public interface IAccountWriteRepository
    {
        Task<Account?> GetAccountAsync(int accountId, CancellationToken cancellationToken);
        Task<Account?> GetAccountByEmailAsync(string email, CancellationToken cancellationToken);
        Task<Account?> GetAccountByUserNameAsync(string userName, CancellationToken cancellationToken);
    }
}
