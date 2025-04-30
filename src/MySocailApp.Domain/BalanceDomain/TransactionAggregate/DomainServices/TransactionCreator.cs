using MySocailApp.Domain.BalanceDomain.TransactionAggregate.Entities;
using MySocailApp.Domain.BalanceDomain.TransactionAggregate.Exceptions;
using MySocailApp.Domain.BalanceDomain.TransactionAggregate.ValueObjects;
using MySocailApp.Domain.BalanceDomain.WalletAggregate.Abstracts;

namespace MySocailApp.Domain.BalanceDomain.TransactionAggregate.DomainServices
{
    public class TransactionCreator(IWalletRepository blanceRepository)
    {
        private readonly IWalletRepository _walletRepository = blanceRepository;

        public async Task CreateAsync(Transaction transaction, CancellationToken cancellationToken)
        {
            var wallet = 
                await _walletRepository.GetAsync(transaction.WalletId, cancellationToken) ??
                throw new WalletNotFoundException();

            if (transaction.Type == TransactionType.Deposit)
                wallet.Deposit(transaction.Money);
            else
                wallet.Withdraw(transaction.Money);
        }
    }
}
