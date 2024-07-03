using MySocailApp.Core.Exceptions;
using System.Net;

namespace MySocailApp.Domain.AccountAggregate.Exceptions
{
    public class InvalidEmailConfirmationTokenException : ClientSideException
    {
        private readonly static string _message = "The token is invalid or expired! If you type the code incorrectly more than 3 times you must request the email to be resent!";
        public InvalidEmailConfirmationTokenException() : base(_message, (int)HttpStatusCode.BadRequest){}
    }
}
