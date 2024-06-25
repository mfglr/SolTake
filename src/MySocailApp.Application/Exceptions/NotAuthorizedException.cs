using MySocailApp.Core.Exceptions;
using System.Net;

namespace MySocailApp.Application.Exceptions
{
    public class NotAuthorizedException : AppException
    {
        private readonly static string _message = "Not Authorized!";
        public NotAuthorizedException() : base(_message, (int)HttpStatusCode.Unauthorized) { }
    }
}
