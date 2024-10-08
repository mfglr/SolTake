using MySocailApp.Domain.AccountAggregate.Entities;

namespace MySocailApp.Domain.AccountAggregate.Abstracts
{
    public interface IAccountReadRepository
    {
        Task<Account?> GetAccountAsync(int accountId, CancellationToken cancellationToken);
    }
}
