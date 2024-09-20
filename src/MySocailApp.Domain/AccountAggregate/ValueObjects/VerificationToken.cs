using System.Security.Cryptography;
using System.Text;

namespace MySocailApp.Domain.AccountAggregate.ValueObjects
{
    public class VerificationToken
    {
        private static string ComputeSha512Hash(string rawData)
        {
            var bytes = SHA512.HashData(Encoding.UTF8.GetBytes(rawData));
            var builder = new StringBuilder();
            for (int i = 0; i < bytes.Length; i++)
                builder.Append(bytes[i].ToString("x2"));
            return builder.ToString();
        }

        public string Token { get; private set; }
        public string TokenHash { get; private set; }
        public DateTime ExpirationAt { get; private set; }
        public int NumberOfFailedAttemps { get; private set; }

        private VerificationToken() { }

        internal static VerificationToken GenerateToken()
        {
            var token = Guid.NewGuid().ToString()[..6].ToUpper();
            return new()
            {
                Token = token,
                TokenHash = ComputeSha512Hash(token),
                ExpirationAt = DateTime.UtcNow.AddMinutes(5),
                NumberOfFailedAttemps = 0
            };
        }

        internal VerificationToken IncreaseNumberOfFailedAttemps() => 
            new() {
                NumberOfFailedAttemps = NumberOfFailedAttemps + 1,
                TokenHash = TokenHash,
                ExpirationAt = ExpirationAt
            };

        internal bool IsValid(string token)
            => ComputeSha512Hash(token) == TokenHash &&  DateTime.UtcNow <= ExpirationAt && NumberOfFailedAttemps < 3;
    }
}
