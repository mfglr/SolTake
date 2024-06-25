using MySocailApp.Application.Services;

namespace MySocailApp.Application.Commands.AccountAggregate
{
    public class LoginResponseDto
    {
        public string Id { get; set; }
        public string Email { get; set; } 
        public string UserName { get; set; }
        public string EmailConfirmed { get; set; }
        public Token Token { get; set; }
    }
}
