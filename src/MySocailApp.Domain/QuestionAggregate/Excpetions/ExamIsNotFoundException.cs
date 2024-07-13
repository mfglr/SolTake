using MySocailApp.Core.Exceptions;
using System.Net;

namespace MySocailApp.Domain.QuestionAggregate.Excpetions
{
    public class ExamIsNotFoundException : ClientSideException
    {
        private readonly static string _message = "Exam is not found";
        public ExamIsNotFoundException() : base(_message, (int)HttpStatusCode.NotFound)
        {
        }
    }
}
