using MySocailApp.Core.Exceptions;
using System.Net;

namespace MySocailApp.Domain.AppUserAggregate.Exceptions
{
    public class UserIsNotBlockedException : ClientSideException
    {
        private readonly static string _message = "The user has not been blocked or the block has been removed before!";
        public UserIsNotBlockedException() : base(_message, (int)HttpStatusCode.BadRequest)
        {
        }
    }
}
