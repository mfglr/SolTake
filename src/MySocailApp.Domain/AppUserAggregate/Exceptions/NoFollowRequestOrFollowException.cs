using MySocailApp.Core.Exceptions;
using System.Net;

namespace MySocailApp.Domain.AppUserAggregate.Exceptions
{
    public class NoFollowRequestOrFollowException : ClientSideException
    {
        private readonly static string _message = "You have not sent a follow request to the user or you are not following the user!The user have may deleted its account!";
        public NoFollowRequestOrFollowException() : base(_message, (int)HttpStatusCode.BadRequest)
        {
        }
    }
}
