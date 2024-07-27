using MySocailApp.Core.Exceptions;
using System.Net;

namespace MySocailApp.Domain.AppUserAggregate.Exceptions
{
    public class UserIsNotFoundException : ClientSideException
    {
        private readonly static string _message = "The user was not found! The user have may deleted its account!";
        public UserIsNotFoundException() : base(_message, (int)HttpStatusCode.NotFound) { }
    }
}
