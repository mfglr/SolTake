using MySocailApp.Core;
using MySocailApp.Domain.BalanceDomain.WalletAggregate.Exceptions;
using MySocailApp.Domain.BalanceDomain.WalletAggregate.ValueObjects;

namespace MySocailApp.Domain.BalanceDomain.WalletAggregate.Entities
{
    public class Wallet : Entity, IAggregateRoot
    {
        public int UserId { get; private set; }
        public Currency Currency { get; private set; }
        public Money Balance { get; private set; }

        public Wallet(int userId,Currency currency)
        {
            UserId = userId;
            Currency = currency;
            Balance = Money.Zero(currency);
        }

        public Wallet(int userId, Currency currency, Money money)
        {
            if (money <= Money.Zero(currency))
                throw new MoneyOutOfRangeOnDepositedException();

            UserId = userId;
            Currency = currency;
            Balance = money;
        }

        public void Create() => CreatedAt = DateTime.UtcNow;

        public void Deposit(Money money)
        {
            if (money <= Money.Zero(Currency))
                throw new MoneyOutOfRangeOnDepositedException();

            Balance += money;
            UpdatedAt = DateTime.UtcNow;
        }

        public void Withdraw(Money money)
        {
            if (money >= Money.Zero(Currency))
                throw new ArgumentOutOfRangeException();

            if (Balance <= Money.Zero(Currency))
                throw new InsufficientFundsException();

            Balance += money;
            UpdatedAt = DateTime.UtcNow;
        }
    }
}
