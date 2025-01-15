using AccountDomain.Exceptions;
using MySocailApp.Core.Exceptions;

namespace AccountDomain.ValueObjects
{
    public class GoogleAccount
    {
        public string UserId { get; private set; }
        public string Email { get; private set; }//not mapped

        private GoogleAccount() { }

        public GoogleAccount(string userId, string email)
        {
            UserId = userId ?? throw new ServerSideException();
            Email = email ?? throw new EmailIsRequiredException();
        }
    }
}
