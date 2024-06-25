using MySocailApp.Core.Exceptions;
using System.Net;

namespace MySocailApp.Domain.AccountAggregate.Exceptions
{
    public class AccountDeactivatedException : ClientSideException
    {
        private readonly static string _message = "Your account is deactived. Please login to activate your account";
        public AccountDeactivatedException() : base(_message, (int)HttpStatusCode.BadRequest) { }
    }
}
