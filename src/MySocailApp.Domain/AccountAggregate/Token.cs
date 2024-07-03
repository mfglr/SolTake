namespace MySocailApp.Domain.AccountAggregate
{
    public class Token(string accessToken, DateTime expirationDateOfAccessToken, string refreshToken, DateTime expirationDateOfRefreshToken)
    {
        public string AccessToken { get; private set; } = accessToken;
        public DateTime ExpirationDateOfAccessToken { get; private set; } = expirationDateOfAccessToken;
        public string RefreshToken { get; private set; } = refreshToken;
        public DateTime ExpirationDateOfRefreshToken { get; private set; } = expirationDateOfRefreshToken;
    }
}
