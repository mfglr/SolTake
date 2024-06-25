using MySocailApp.Core.Exceptions;
using System.Net;

namespace MySocailApp.Domain.AppUserAggregate.Exceptions
{
    public class UserIsNotFollowerException : ClientSideException
    {
        private readonly static string _message = "The user is not follow you anyway!";
        public UserIsNotFollowerException() : base(_message, (int)HttpStatusCode.BadRequest)
        {
        }
    }
}
