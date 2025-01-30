using AccountDomain.AccountAggregate.Entities;
using AccountDomain.AccountAggregate.ValueObjects;

namespace AccountDomain.AccountAggregate.Abstracts
{
    public interface IAccountReadRepository
    {
        Task<Account?> GetAccountAsync(int accountId, CancellationToken cancellationToken);
        Task<List<int>> GetAccountIdsByUserNames(IEnumerable<string> userNames, CancellationToken cancellationToken);
        Task<bool> IsEmailVerified(int accountId, CancellationToken cancellationToken);
        Task<bool> EmailExist(Email email, CancellationToken cancellationToken);
        Task<bool> UserNameExist(UserName userName, CancellationToken cancellationToken);
        Task<bool> Exist(int accountId, CancellationToken cancellationToken);
    }
}
