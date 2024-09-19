namespace MySocailApp.Domain.AccountAggregate.ValueObjects
{
    public class VerificationToken
    {
        public string Token { get; private set; }
        public DateTime ExpirationAt { get; private set; }
        public int NumberOfFailedAttemps { get; private set; }

        internal VerificationToken IncreaseNumberOfFailedAttemps()
            => new(Token, ExpirationAt) { NumberOfFailedAttemps = NumberOfFailedAttemps + 1 };

        private VerificationToken(string token, DateTime expirationAt)
        {
            Token = token;
            ExpirationAt = expirationAt;
        }

        internal static VerificationToken GenerateToken()
        {
            var token = Guid.NewGuid().ToString()[..6].ToUpper();
            return new VerificationToken(token, DateTime.UtcNow.AddMinutes(30));
        }

        internal bool IsValid(string token) => token == Token && DateTime.UtcNow <= ExpirationAt && NumberOfFailedAttemps < 3;
    }
}
