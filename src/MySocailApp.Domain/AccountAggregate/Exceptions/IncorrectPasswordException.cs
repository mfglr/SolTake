using MySocailApp.Core.Exceptions;
using System.Net;

namespace MySocailApp.Domain.AccountAggregate.Exceptions
{
    public class IncorrectPasswordException : ClientSideException
    {
        public IncorrectPasswordException() : base("The password is incorrect", (int)HttpStatusCode.BadRequest){}
    }
}
