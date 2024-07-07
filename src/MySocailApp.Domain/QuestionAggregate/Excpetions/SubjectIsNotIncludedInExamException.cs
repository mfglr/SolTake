using MySocailApp.Core.Exceptions;
using System.Net;

namespace MySocailApp.Domain.QuestionAggregate.Exceptions
{
    public class SubjectIsNotIncludedInExamException : ClientSideException
    {
        private readonly static string _message = "This subject is not included in this exam.";
        public SubjectIsNotIncludedInExamException() : base(_message, (int)HttpStatusCode.BadRequest)
        {
        }
    }
}
