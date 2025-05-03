using MySocailApp.Core;
using MySocailApp.Core.AIModel;

namespace MySocailApp.Domain.BalanceAggregate.Entities
{
    public class Balance : Entity, IAggregateRoot
    {
        public Sol Credit { get; private set; }

        private Balance() { }
        public Balance(int id) : base(id) => Credit = Sol.Zero();
        public Balance(int id, Sol credit) : base(id) => Credit = credit;

        public void Create() => CreatedAt = DateTime.UtcNow;

        public void Apply(Sol sol)
        {
            Credit += sol;
            UpdatedAt = DateTime.UtcNow;
        }
    }
}
