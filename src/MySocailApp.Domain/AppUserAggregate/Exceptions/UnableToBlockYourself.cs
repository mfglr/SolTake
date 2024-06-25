using MySocailApp.Core.Exceptions;
using System.Net;

namespace MySocailApp.Domain.AppUserAggregate.Exceptions
{
    public class UnableToBlockYourself : ClientSideException
    {
        private readonly static string _message = "You can't block yourself!";
        public UnableToBlockYourself() : base(_message, (int)HttpStatusCode.BadRequest)
        {
        }
    }
}
