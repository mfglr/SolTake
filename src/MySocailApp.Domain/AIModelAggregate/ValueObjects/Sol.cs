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

        public static Sol operator +(Sol s1, Sol s2) => new(s1.Amount + s2.Amount);
        public static Sol operator *(double p, Sol sol) => new(Convert.ToInt32(Math.Ceiling(p * sol.Amount)));
        public static Sol operator *(Sol sol, double p) => new(Convert.ToInt32(Math.Ceiling(sol.Amount * p)));
    }
}
