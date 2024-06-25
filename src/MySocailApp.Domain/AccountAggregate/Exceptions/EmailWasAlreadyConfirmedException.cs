using MySocailApp.Core.Exceptions;
using System.Net;

namespace MySocailApp.Domain.AccountAggregate.Exceptions
{
    public class EmailWasAlreadyConfirmedException : ClientSideException
    {
        private readonly static string _message = "Your email has been already confirmed!";
        public EmailWasAlreadyConfirmedException() : base(_message, (int)HttpStatusCode.BadRequest) { }
    }
}