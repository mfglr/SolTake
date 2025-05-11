using MySocailApp.Domain.UserAggregate.DomainServices;
using System.Security.Cryptography;

namespace MySocailApp.Domain.UserAggregate.ValueObjects
{
    public class RefreshToken
    {
        private readonly static int _validityPeriod = 30;

        public byte[] Hash { get; private set; }
        public string Value { get; private set; }
        public DateTime ExpiredAt { get; private set; }

        private RefreshToken() { }

        private RefreshToken(string value)
        {
            Value = value;
            Hash = HashComputer.Compute(value);
            ExpiredAt = DateTime.UtcNow.AddDays(_validityPeriod);
        }

        public bool Check(string value) => 
            HashComputer.Check(value, Hash) &&
            DateTime.UtcNow <= ExpiredAt;


        public static RefreshToken CreateRandom()
        {
            var numberByte = new byte[32];
            using var random = RandomNumberGenerator.Create();
            random.GetBytes(numberByte);
            return new(Convert.ToBase64String(numberByte));
        }
    }
}
