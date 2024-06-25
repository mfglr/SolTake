using MySocailApp.Core.Exceptions;
using System.Net;

namespace MySocailApp.Domain.AppUserAggregate.Exceptions
{
    public class UserIsBlockedException : ClientSideException
    {
        private readonly static string _message = "You should remove the user's ban.";
        public UserIsBlockedException() : base(_message, (int)HttpStatusCode.BadRequest)
        {
        }
    }
}
