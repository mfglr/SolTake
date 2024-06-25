using MySocailApp.Core.Exceptions;
using System.Net;

namespace MySocailApp.Domain.AppUserAggregate.Exceptions
{
    public class UserIsNotFoundException : AppException
    {
        private readonly static string _message = "The user is not found!";
        public UserIsNotFoundException() : base(_message, (int)HttpStatusCode.NotFound) { }
    }
}
