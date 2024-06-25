using MySocailApp.Core.Exceptions;
using System.Net;

namespace MySocailApp.Domain.AppUserAggregate.Exceptions
{
    public class UserIsNotFollowedException : ClientSideException
    {
        private readonly static string _message = "You are not following the user anyway!";
        public UserIsNotFollowedException() : base(_message, (int)HttpStatusCode.BadRequest)
        {
        }
    }
}
