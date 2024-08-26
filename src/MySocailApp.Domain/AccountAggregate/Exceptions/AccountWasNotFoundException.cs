using MySocailApp.Core.Exceptions;
using System.Net;

namespace MySocailApp.Domain.AccountAggregate.Exceptions
{
    public class AccountWasNotFoundException : ClientSideException
    {
        private readonly static string _message = "The account was not found!";
        public AccountWasNotFoundException() : base(_message, (int)HttpStatusCode.NotFound){}
    }
}