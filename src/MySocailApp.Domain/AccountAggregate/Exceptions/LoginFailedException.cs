using MySocailApp.Core.Exceptions;
using System.Net;

namespace MySocailApp.Domain.AccountAggregate.Exceptions
{
    public class LoginFailedException : ClientSideException
    {
        public LoginFailedException() : base("Email or username or password is incorrect!", (int)HttpStatusCode.BadRequest)
        {
        }
    }
}
