using MySocailApp.Core.Exceptions;
using System.Net;

namespace MySocailApp.Domain.AccountAggregate.Exceptions
{
    public class AccountWasNotFoundException : ClientSideException
    {
        public AccountWasNotFoundException() : base("The account was not found!", (int)HttpStatusCode.NotFound)
        {
        }
    }
}