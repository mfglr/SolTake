using MySocailApp.Core.Exceptions;
using System.Net;

namespace MySocailApp.Domain.AppUserAggregate.Exceptions
{
    public class InvalidBirthDateException : ClientSideException
    {
        public static readonly string _message = "The date of birth must be earlier than the current date!";
        public InvalidBirthDateException() : base(_message, (int)HttpStatusCode.BadRequest)
        {
        }
    }
}
