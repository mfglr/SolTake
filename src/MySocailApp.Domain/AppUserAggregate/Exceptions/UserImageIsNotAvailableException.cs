using MySocailApp.Core.Exceptions;
using System.Net;

namespace MySocailApp.Domain.AppUserAggregate.Exceptions
{
    public class UserImageIsNotAvailableException : ClientSideException
    {
        private readonly static string _message = "No profile image!";
        public UserImageIsNotAvailableException() : base(_message, (int)HttpStatusCode.BadRequest){}
    }
}
