using MySocailApp.Core.Exceptions;
using System.Net;

namespace MySocailApp.Domain.QuestionAggregate.Excpetions
{
    public class InvalidBlobName(string blobName) : ClientSideException($"{_message}'{blobName}'", (int)HttpStatusCode.NotFound)
    {
        private readonly static string _message = "This question has not a blob named ";
    }
}
