using MySocailApp.Core.Exceptions;

namespace MySocailApp.Domain.AccountAggregate.ValueObjects
{
    public class GoogleUser
    {
        public string UserId { get; private set; }
        public string? Email { get; private set; }

        public GoogleUser(string userId, string? email)
        {
            UserId = userId ?? throw new ServerSideException();
            Email = email;
        }
    }
}
