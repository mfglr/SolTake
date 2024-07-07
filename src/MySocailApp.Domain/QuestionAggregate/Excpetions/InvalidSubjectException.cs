using MySocailApp.Core.Exceptions;
using System.Net;

namespace MySocailApp.Domain.QuestionAggregate.Excpetions
{
    public class InvalidSubjectException : ClientSideException
    {
        private readonly static string _message = "Subject is invalid!";
        public InvalidSubjectException() : base(_message, (int)HttpStatusCode.BadRequest) { }
    }
}
