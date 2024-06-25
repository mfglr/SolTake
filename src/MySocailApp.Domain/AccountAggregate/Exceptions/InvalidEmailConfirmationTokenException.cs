using MySocailApp.Core.Exceptions;
using System.Net;

namespace MySocailApp.Domain.AccountAggregate.Exceptions
{
    public class InvalidEmailConfirmationTokenException : ClientSideException
    {
        private readonly static string _message = "The token is invalid or expired!";
        public InvalidEmailConfirmationTokenException() : base(_message, (int)HttpStatusCode.BadRequest){}
    }
}
