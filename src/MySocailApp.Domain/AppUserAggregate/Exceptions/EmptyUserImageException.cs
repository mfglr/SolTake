using MySocailApp.Core.Exceptions;
using System.Net;

namespace MySocailApp.Domain.AppUserAggregate.Exceptions
{
    public class EmptyUserImageException : ClientSideException
    {
        private readonly static string _message = "The image is empty!";
        public EmptyUserImageException() : base(_message, (int)HttpStatusCode.BadRequest) { }
    }
}
