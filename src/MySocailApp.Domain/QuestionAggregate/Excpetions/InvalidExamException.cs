using MySocailApp.Core.Exceptions;
using System.Net;

namespace MySocailApp.Domain.QuestionAggregate.Excpetions
{
    public class InvalidExamException : ClientSideException
    {
        private readonly static string _message = "Exam is not valid!";
        public InvalidExamException() : base(_message, (int)HttpStatusCode.BadRequest)
        {
        }
    }
}
