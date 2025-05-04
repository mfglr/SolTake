namespace MySocailApp.Core.AIModel
{
    public class Sol(int amount)
    {
        public int Amount { get; private set; } = amount;

        public static Sol Zero() => new(0);

        public static Sol operator +(Sol x, Sol y) => new(x.Amount + y.Amount);
        public static Sol operator -(Sol x, Sol y) => new(x.Amount - y.Amount);

        public static Sol operator *(int x, Sol y) => new(x * y.Amount);
        public static Sol operator *(Sol x, int y) => new(x.Amount * y);

        public static Sol operator *(double x, Sol y) => new((int)Math.Ceiling(x * y.Amount));
        public static Sol operator *(Sol x, double y) => new((int)Math.Ceiling(x.Amount * y));
    }
}
