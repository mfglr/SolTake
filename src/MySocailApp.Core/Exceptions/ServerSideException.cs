using System.Net;

namespace MySocailApp.Core.Exceptions
{
    public class ServerSideException : AppException
    {
        private readonly static string _message = "Something went wrong! Please try again!";
        public ServerSideException(string message) : base($"{_message} : {message}", (int)HttpStatusCode.InternalServerError){}
        public ServerSideException(IEnumerable<string> messages) : base($"{_message} : {string.Join(' ',messages)}", (int)HttpStatusCode.InternalServerError) { }

    }
}
