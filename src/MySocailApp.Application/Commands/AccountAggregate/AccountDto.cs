namespace MySocailApp.Application.Commands.AccountAggregate
{
    public class AccountDto
    {
        public int Id { get; private set; }
        public DateTime CreatedAt { get; private set; }
        public DateTime? UpdatedAt { get; private set; }
        public string Email { get; private set; } = null!;
        public string UserName { get; private set; } = null!;
        public bool EmailConfirmed { get; private set; }
        public bool IsThirdPartyAuthenticated { get; private set; }
        public string AccessToken { get; private set; } = null!;
        public string RefreshToken { get; private set; } = null!;
        
        private AccountDto() { }
    }
}
