using MySocailApp.Core.Exceptions;
using System.Net;

namespace MySocailApp.Domain.AppUserAggregate.Exceptions
{
    public class UserIsNotFollowerException : ClientSideException
    {
        private readonly static string _message = "The user does not follow you!";
        public UserIsNotFollowerException() : base(_message, (int)HttpStatusCode.BadRequest)
        {
        }
    }
}
