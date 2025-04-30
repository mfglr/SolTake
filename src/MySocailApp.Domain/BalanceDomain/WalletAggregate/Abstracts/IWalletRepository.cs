using MySocailApp.Domain.BalanceDomain.WalletAggregate.Entities;

namespace MySocailApp.Domain.BalanceDomain.WalletAggregate.Abstracts
{
    public interface IWalletRepository
    {
        Task CreateAsync(Wallet balance, CancellationToken cancellationToken);
        Task<Wallet> GetAsync(int id, CancellationToken cancellationToken);
    }
}
