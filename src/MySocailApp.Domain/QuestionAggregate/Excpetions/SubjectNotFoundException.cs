using MySocailApp.Core.Exceptions;
using System.Net;

namespace MySocailApp.Domain.QuestionAggregate.Excpetions
{
    public class SubjectNotFoundException : ClientSideException
    {
        private static readonly string _message = "Subject could not be found!";
        public SubjectNotFoundException() : base(_message, (int)HttpStatusCode.BadRequest){}
    }
}
