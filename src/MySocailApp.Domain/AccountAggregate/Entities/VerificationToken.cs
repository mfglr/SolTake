using MySocailApp.Domain.AccountAggregate.Exceptions;
using System.ComponentModel.DataAnnotations.Schema;
using System.Security.Cryptography;
using System.Text;

namespace MySocailApp.Domain.AccountAggregate.Entities
{
    public class VerificationToken
    {
        public int Id { get; private set; }
        public DateTime CreatedAt { get; private set; }
        public int AccountId { get; private set; }
        public DateTime? VerifiedAt { get; private set; }
        public bool IsVerified { get; private set; }
        [NotMapped]
        public string Token { get; private set; }
        public string TokenHash { get; private set; }
        public DateTime ExpirationAt { get; private set; }
        public int NumberOfFailedAttemps { get; private set; }

        private VerificationToken() { }

        private static string ComputeSha512Hash(string rawData)
        {
            var bytes = SHA512.HashData(Encoding.UTF8.GetBytes(rawData));
            var builder = new StringBuilder();
            for (int i = 0; i < bytes.Length; i++)
                builder.Append(bytes[i].ToString("x2"));
            return builder.ToString();
        }

        internal static VerificationToken Create()
        {
            var token = Guid.NewGuid().ToString()[..6].ToUpper();
            return new() {
                Token = token,
                TokenHash = ComputeSha512Hash(token),
                CreatedAt = DateTime.UtcNow,
                ExpirationAt = DateTime.UtcNow.AddMinutes(5),
                NumberOfFailedAttemps = 0
            };
        }

        private bool IsValid(string token) 
            => ComputeSha512Hash(token) == TokenHash && DateTime.UtcNow <= ExpirationAt && NumberOfFailedAttemps < 3;

        internal void Verify(string token)
        {
            if (IsVerified) return;
            if (!IsValid(token))
            {
                NumberOfFailedAttemps += 1;
                throw new InvalidVerificationTokenException();
            }
            IsVerified = true;
            VerifiedAt = DateTime.UtcNow;
        }
    }
}
