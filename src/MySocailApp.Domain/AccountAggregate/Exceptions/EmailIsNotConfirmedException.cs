using MySocailApp.Core.Exceptions;
using System.Net;

namespace MySocailApp.Domain.AccountAggregate.Exceptions
{
    public class EmailIsNotConfirmedException : ClientSideException
    {
        private readonly static string _message = "You must confirm your email first!";
        public EmailIsNotConfirmedException() : base(_message, (int)HttpStatusCode.BadRequest){}
    }
}
