using MySocailApp.Core.Exceptions;
using System.Net;

namespace MySocailApp.Domain.AppUserAggregate.Exceptions
{
    public class UserIsAlreadyFollowedException : ClientSideException
    {
        private readonly static string _message = "You have followed the user before!";
        public UserIsAlreadyFollowedException() : base(_message, (int)HttpStatusCode.BadRequest)
        {
        }
    }
}
