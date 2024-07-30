using MySocailApp.Core.Exceptions;
using System.Net;

namespace MySocailApp.Domain.ExamAggregate.Exceptions
{
    public class ExamNotFoundException : ClientSideException
    {
        private readonly static string _message = "Exam could not be found";
        public ExamNotFoundException() : base(_message, (int)HttpStatusCode.NotFound)
        {
        }
    }
}
