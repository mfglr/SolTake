using MySocailApp.Core.Exceptions;
using System.Net;

namespace MySocailApp.Domain.AppUserAggregate.Exceptions
{
    public class FollowRequestAlreadyExistException : ClientSideException
    {
        private readonly static string _message = "You have made a request to follow the user before!";
        public FollowRequestAlreadyExistException() : base(_message, (int)HttpStatusCode.BadRequest)
        {
        }
    }
}
