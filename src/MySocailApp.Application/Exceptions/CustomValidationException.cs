using MySocailApp.Core.Exceptions;
using System.Net;

namespace MySocailApp.Application.Exceptions
{
    public class CustomValidationException(IEnumerable<string> message) : ClientSideException(message, (int)HttpStatusCode.BadRequest)
    {
    }
}
