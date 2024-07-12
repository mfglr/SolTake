namespace MySocailApp.Domain.AccountAggregate
{
    public class EmailConfirmationToken
    {
        public string Token { get; private set; }
        public DateTime ExpirationAt { get; private set; }
        public int NumberOfFailedAttemps { get; private set; }

        internal EmailConfirmationToken IncreaseNumberOfFailedAttemps()
            => new(Token, ExpirationAt) { NumberOfFailedAttemps = NumberOfFailedAttemps + 1 };

        private EmailConfirmationToken(string token, DateTime expirationAt)
        {
            Token = token;
            ExpirationAt = expirationAt;
        }

        internal static EmailConfirmationToken GenerateToken()
        {
            var token = Guid.NewGuid().ToString()[..6].ToUpper();
            return new EmailConfirmationToken(token, DateTime.UtcNow.AddMinutes(60));
        }

        internal bool IsValid(string token) => token == Token && DateTime.UtcNow <= ExpirationAt && NumberOfFailedAttemps < 3;
    }
}
