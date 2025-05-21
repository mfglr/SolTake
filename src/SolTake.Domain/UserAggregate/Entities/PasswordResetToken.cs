using SolTake.Domain.UserAggregate.Exceptions;
using SolTake.Domain.UserAggregate.DomainServices;

namespace SolTake.Domain.UserAggregate.Entities
{
    public class PasswordResetToken
    {

        public int UserId { get; private set; }

        public int Id { get; private set; }
        public DateTime CreatedAt { get; private set; }
        public string Value { get; private set; }//not mapped
        public byte[] Hash { get; private set; }
        public DateTime ExpirationAt { get; private set; }
        public int NumberOfFailedAttemps { get; private set; }

        private PasswordResetToken() { }

        internal static PasswordResetToken Create()
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

        internal void Check(string token)
        {
            if (!IsValid(token))
            {
                NumberOfFailedAttemps += 1;
                throw new InvalidTokenException();
            }
        }
    }
}
