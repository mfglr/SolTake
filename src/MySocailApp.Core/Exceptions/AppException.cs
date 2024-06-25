using System.Net;

namespace MySocailApp.Core.Exceptions
{
    public class AppException : Exception
    {
        public int StatusCode { get; private set; }
        public AppException(string message, int statusCode) : base(message)
        {
            StatusCode = statusCode;
        }
        public AppException(IEnumerable<string> messages, int statusCode) : base(string.Join(", ", messages))
        {
            StatusCode = statusCode;
        }
    }
}
