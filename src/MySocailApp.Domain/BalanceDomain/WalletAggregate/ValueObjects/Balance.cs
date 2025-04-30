using MySocailApp.Domain.BalanceDomain.WalletAggregate.Exceptions;

namespace MySocailApp.Domain.BalanceDomain.WalletAggregate.ValueObjects
{
    public class Balance
    {
        public Currency Currency { get; private set; }
        public decimal Value { get; private set; }

        private Balance(decimal value, Currency currency)
        {
            Currency = currency;
            Value = value;
        }

        public static Balance Zero(Currency currency) => new(0,currency);


        public void Deposit(Money money)
        {
            if (Currency != money.Currency)
                throw new CurrencyMismatchException();

            Value += money.Amount;
        }

        public void Withdraw(Money money)
        {
            if (Currency != money.Currency)
                throw new CurrencyMismatchException();

            if (Value <= 0)
                throw new InsufficientFundsException();

            Value -= money.Amount;
        }
    }
}
