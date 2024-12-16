using MySocailApp.Core.Exceptions;
using MySocailApp.Domain.AccountDomain.AccountAggregate.Exceptions;

namespace MySocailApp.Domain.AccountDomain.AccountAggregate.ValueObjects
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
