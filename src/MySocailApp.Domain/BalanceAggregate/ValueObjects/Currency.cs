namespace MySocailApp.Domain.BalanceAggregate.ValueObjects
{
    public class Currency(string value)
    {
        public string Value { get; private set; } = value;

        public static Currency Dollar() => new("$");

        public static bool operator ==(Currency x, Currency y) => x.Value == y.Value;
        public static bool operator !=(Currency x, Currency y) => x.Value != y.Value;

        public override bool Equals(object? obj) =>
            obj != null &&
            obj is Currency other &&
            Value == other.Value;

        public override int GetHashCode() => Value.GetHashCode();
    }
}
