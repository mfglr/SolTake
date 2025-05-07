using MySocailApp.Domain.AIModelAggregate.Exceptions;

namespace MySocailApp.Domain.AIModelAggregate.ValueObjects
{
    public class Sol
    {
        public int Amount { get; private set; }

        public Sol(int amount)
        {
            if (amount < 0)
                throw new InvalidSolValueException();
            Amount = amount;
        }
    }
}
