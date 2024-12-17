namespace MySocailApp.Application.Commands.AccountAggregate
{
    public class AccountDto
    {
        public int Id { get; private set; }
        public DateTime CreatedAt { get; private set; }
        public DateTime? UpdatedAt { get; private set; }
        public string? Email { get; private set; } = null!;
        public string UserName { get; private set; } = null!;
        public bool IsEmailVerified { get; private set; }
        public string Language { get; private set; }
        public string AccessToken { get; private set; } = null!;
        public string RefreshToken { get; private set; } = null!;
        public bool IsPrivacyPolicyApproved { get; private set; }
        public bool IsTermsOfUseApproved { get; private set; }
        public bool IsGoogleAuthenticated { get; private set; }

        private AccountDto() { }
    }
}
