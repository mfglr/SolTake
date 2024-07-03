using MySocailApp.Core.Exceptions;
using System.Net;

namespace MySocailApp.Domain.AppUserAggregate.Exceptions
{
    public class CustomFileNotFoundException : ClientSideException
    {
        private readonly static string _message = "File is not found exception!";
        public CustomFileNotFoundException() : base(_message, (int)HttpStatusCode.NotFound) { }
    }
}
