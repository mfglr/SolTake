using MySocailApp.Domain.UserDomain.UserAggregate.DomainServices;
using MySocailApp.Domain.UserDomain.UserAggregate.Exceptions;

namespace MySocailApp.Domain.UserDomain.UserAggregate.Entities
{
    public class EmailVerificationToken
    {
        public int UserId { get; private set; }

        public int Id { get; private set; }
        public DateTime CreatedAt { get; private set; }
        public DateTime? VerifiedAt { get; private set; }
        public bool IsVerified { get; private set; }
        public string Value { get; private set; }//not mapped
        public byte[] Hash { get; private set; }
        public DateTime ExpirationAt { get; private set; }
        public int NumberOfFailedAttemps { get; private set; }

        private EmailVerificationToken() { }

        internal static EmailVerificationToken Create()
        {
            var token = Guid.NewGuid().ToString()[..6].ToUpper();
            return new()
            {
                Value = token,
                Hash = HashComputer.Compute(token),
                CreatedAt = DateTime.UtcNow,
                ExpirationAt = DateTime.UtcNow.AddMinutes(5),
                NumberOfFailedAttemps = 0
            };
        }

        private bool IsValid(string token)
            => HashComputer.Check(token, Hash) && DateTime.UtcNow <= ExpirationAt && NumberOfFailedAttemps < 3;

        internal void Verify(string token)
        {
            if (IsVerified) return;

            if (!IsValid(token))
            {
                NumberOfFailedAttemps += 1;
                throw new InvalidTokenException();
            }
            IsVerified = true;
            VerifiedAt = DateTime.UtcNow;
        }
    }
}
