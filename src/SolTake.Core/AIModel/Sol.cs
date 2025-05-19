namespace SolTake.Core.AIModel
{
    public class Sol(int amount)
    {
        public int Amount { get; private set; } = amount;

        public static Sol Zero() => new(0);

        public static Sol operator +(Sol s1, Sol s2) => new(s1.Amount + s2.Amount);
        public static Sol operator *(double p, Sol sol) => new(Convert.ToInt32(Math.Ceiling(p * sol.Amount)));
        public static Sol operator *(Sol sol, double p) => new(Convert.ToInt32(Math.Ceiling(sol.Amount * p)));
    }
}
