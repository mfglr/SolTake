using MySocailApp.Core.Exceptions;
using System.Net;

namespace MySocailApp.Domain.AppUserAggregate.Exceptions
{
    public class FollowRequestIsNotFoundException : ClientSideException
    {
        private readonly static string _message = "The user have not made a request to follow you or the user may have deleted its account.";
        public FollowRequestIsNotFoundException() : base(_message, (int)HttpStatusCode.BadRequest)
        {
        }
    }
}
