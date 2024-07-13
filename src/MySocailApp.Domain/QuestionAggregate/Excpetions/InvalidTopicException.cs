using MySocailApp.Core.Exceptions;
using System.Net;

namespace MySocailApp.Domain.QuestionAggregate.Excpetions
{
    public class InvalidTopicException : ClientSideException
    {
        private readonly static string _message = "Some topics are not suitable for this question!";
        public InvalidTopicException() : base(_message, (int)HttpStatusCode.BadRequest)
        {
        }
    }
}
