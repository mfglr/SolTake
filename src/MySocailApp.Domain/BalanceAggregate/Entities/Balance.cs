using MySocailApp.Core;
using MySocailApp.Domain.BalanceAggregate.ValueObjects;

namespace MySocailApp.Domain.BalanceAggregate.Entities
{
    public class Balance : Entity, IAggregateRoot
    {
        public Currency Currency { get; private set; }
        public Money Credit { get; private set; }

        public Balance(int id, Currency currency) : base(id)
        {
            Currency = currency;
            Credit = Money.Zero(currency);
        }

        public Balance(int id, Money money) : base(id)
        {
            Currency = new(money.Currency.Value);
            Credit = money;
        }

        public void Create() => CreatedAt = DateTime.UtcNow;

        public void Apply(Money money)
        {
            Credit += money;
            UpdatedAt = DateTime.UtcNow;
        }
    }
}
