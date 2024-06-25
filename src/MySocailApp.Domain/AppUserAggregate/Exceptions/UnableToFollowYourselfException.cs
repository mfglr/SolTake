using MySocailApp.Core.Exceptions;
using System.Net;

namespace MySocailApp.Domain.AppUserAggregate.Exceptions
{
    public class UnableToFollowYourselfException : ClientSideException
    {
        private readonly static string _message = "You can't follow yourself!";
        public UnableToFollowYourselfException() : base(_message, (int)HttpStatusCode.BadRequest)
        {

        }
    }
}
