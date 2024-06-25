using System.Net;

namespace MySocailApp.Core.Exceptions
{
    public class ClientSideException : AppException
    {
        public ClientSideException(string message, int statusCode) : base(message, statusCode)
        {
        }

        public ClientSideException(IEnumerable<string> messages, int statusCode) : base(messages, statusCode)
        {
        }
    }
}
