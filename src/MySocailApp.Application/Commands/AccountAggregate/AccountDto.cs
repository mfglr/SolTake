using MySocailApp.Domain.AccountAggregate;

namespace MySocailApp.Application.Commands.AccountAggregate
{
    public class AccountDto
    {
        public int Id { get; set; }
        public DateTime CreatedAt { get; set; }
        public DateTime? UpdatedAt { get; set; }
        public string Email { get; set; } 
        public string UserName { get; set; }
        public string EmailConfirmed { get; set; }
        public Token Token { get; set; }
    }
}
