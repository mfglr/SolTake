using MySocailApp.Domain.BalanceDomain.WalletAggregate.Exceptions;

namespace MySocailApp.Domain.BalanceDomain.WalletAggregate.ValueObjects
{
    public class Money
    {
        public Currency Currency { get; private set; }
        public decimal Amount { get; private set; }

        private Money(Currency currency, decimal amount)
        {
            Currency = currency;
            Amount = amount;
        }

        private static void EnsureSameCurrency(Money x, Money y)
        {
            if (x.Currency != y.Currency)
                throw new CurrencyMismatchException();
        }

        public static Money Zero(Currency currency) => new(currency, 0);
        
        public static Money operator+(Money x, Money y)
        {
            EnsureSameCurrency(x, y);
            return new(x.Currency, x.Amount + y.Amount);
        }

        public static Money operator-(Money x, Money y)
        {
            EnsureSameCurrency(x, y);
            return new(x.Currency, x.Amount - y.Amount);
        }

        public static bool operator==(Money x, Money y)
        {
            EnsureSameCurrency(x, y);
            return x.Amount == y.Amount;
        }

        public static bool operator!=(Money x, Money y)
        {
            EnsureSameCurrency(x, y);
            return x.Amount != y.Amount;
        }

        public static bool operator<(Money x, Money y)
        {
            EnsureSameCurrency(x, y);
            return x.Amount < y.Amount;
        }
        
        public static bool operator<=(Money x, Money y)
        {
            EnsureSameCurrency(x, y);
            return x.Amount <= y.Amount;
        }

        public static bool operator>(Money x, Money y)
        {
            EnsureSameCurrency(x, y);
            return x.Amount > y.Amount;
        }

        public static bool operator>=(Money x, Money y)
        {
            EnsureSameCurrency(x, y);
            return x.Amount >= y.Amount;
        }

        public override bool Equals(object? obj) =>
            obj != null &&
            obj is Money other &&
            Amount == other.Amount &&
            Currency == other.Currency;

        public override int GetHashCode() => HashCode.Combine(Amount, Currency);
    }
}
