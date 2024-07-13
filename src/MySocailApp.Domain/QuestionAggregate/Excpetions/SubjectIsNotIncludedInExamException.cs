using MySocailApp.Core.Exceptions;
using System.Net;

namespace MySocailApp.Domain.QuestionAggregate.Excpetions
{
    public class SubjectIsNotIncludedInExamException : ClientSideException
    {
        private readonly static string _message = "The subject is not included in the exam.";
        public SubjectIsNotIncludedInExamException() : base(_message, (int)HttpStatusCode.BadRequest)
        {
        }
    }
}
