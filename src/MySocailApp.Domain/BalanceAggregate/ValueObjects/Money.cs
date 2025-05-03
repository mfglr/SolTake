using MySocailApp.Domain.BalanceAggregate.Exceptions;

namespace MySocailApp.Domain.BalanceAggregate.ValueObjects
{
    public class Money
    {
        public Currency Currency { get; private set; }
        public decimal Amount { get; private set; }

        private Money() { }

        private Money(Currency currency, decimal amount)
        {
            Currency = currency;
            Amount = amount;
        }

        public Money(Money money)
        {
            Currency = new(money.Currency.Value);
            Amount = money.Amount;
        }

        public static Money Dollar(decimal amount) => new(Currency.Dollar(), amount);

        private static void EnsureSameCurrency(Money x, Money y)
        {
            if (x.Currency != y.Currency)
                throw new CurrencyMismatchException();
        }

        public static Money Zero(Currency currency) => new(currency, 0);

        public static Money operator +(Money x, Money y)
        {
            EnsureSameCurrency(x, y);
            return new(new(x.Currency.Value), x.Amount + y.Amount);
        }

        //public static Money operator -(Money x, Money y)
        //{
        //    EnsureSameCurrency(x, y);
        //    return new(x.Currency, x.Amount - y.Amount);
        //}

        //public static bool operator ==(Money x, Money y)
        //{
        //    EnsureSameCurrency(x, y);
        //    return x.Amount == y.Amount;
        //}

        //public static bool operator !=(Money x, Money y)
        //{
        //    EnsureSameCurrency(x, y);
        //    return x.Amount != y.Amount;
        //}

        //public static bool operator <(Money x, Money y)
        //{
        //    EnsureSameCurrency(x, y);
        //    return x.Amount < y.Amount;
        //}

        //public static bool operator <=(Money x, Money y)
        //{
        //    EnsureSameCurrency(x, y);
        //    return x.Amount <= y.Amount;
        //}

        //public static bool operator >(Money x, Money y)
        //{
        //    EnsureSameCurrency(x, y);
        //    return x.Amount > y.Amount;
        //}

        //public static bool operator >=(Money x, Money y)
        //{
        //    EnsureSameCurrency(x, y);
        //    return x.Amount >= y.Amount;
        //}

        //public override bool Equals(object? obj) =>
        //    obj != null &&
        //    obj is Money other &&
        //    Amount == other.Amount &&
        //    Currency == other.Currency;

        //public override int GetHashCode() => HashCode.Combine(Amount, Currency);
    }
}
