using MySocailApp.Core;
using MySocailApp.Domain.BalanceAggregate.ValueObjects;

namespace MySocailApp.Domain.BalanceAggregate.Entities
{
    public class Balance : Entity, IAggregateRoot
    {
        public Money Credit { get; private set; }

        private Balance() { }

        public Balance(int id, Currency currency) : base(id)
        {
            Credit = Money.Zero(currency);
        }

        public Balance(int id, Money money) : base(id)
        {
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
