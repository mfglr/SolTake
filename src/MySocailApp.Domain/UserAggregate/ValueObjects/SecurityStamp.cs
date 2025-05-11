namespace MySocailApp.Domain.UserAggregate.ValueObjects
{
    public class SecurityStamp
    {
        public string Value { get; private set; }

        private SecurityStamp(string value) => Value = value;

        public static SecurityStamp CreateRandom() => new(Guid.NewGuid().ToString().Replace("-", "").ToUpper());

        public static bool operator ==(SecurityStamp left, SecurityStamp right) => left.Value == right.Value;
        public static bool operator !=(SecurityStamp left, SecurityStamp right) => left.Value != right.Value;
    }
}
