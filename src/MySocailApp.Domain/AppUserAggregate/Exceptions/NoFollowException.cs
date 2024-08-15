using MySocailApp.Core.Exceptions;
using System.Net;

namespace MySocailApp.Domain.AppUserAggregate.Exceptions
{
    public class NoFollowException : ClientSideException
    {
        private readonly static string _message = "you are not following the user! The user have may deleted its account!";
        public NoFollowException() : base(_message, (int)HttpStatusCode.BadRequest)
        {
        }
    }
}
