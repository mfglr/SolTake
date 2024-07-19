using MySocailApp.Core.Exceptions;
using System.Net;

namespace MySocailApp.Domain.QuestionAggregate.Excpetions
{
    public class SubjectIsNotFoundException : ClientSideException
    {
        private static readonly string _message = "Subject is not found!";
        public SubjectIsNotFoundException() : base(_message, (int)HttpStatusCode.BadRequest){}
    }
}
